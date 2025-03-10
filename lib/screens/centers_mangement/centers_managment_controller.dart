import 'dart:convert';

import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import '../../models/city.dart';
import '../../models/neighborhood.dart';
import '../../native_service/get_storage.dart';
import '../../routes/app_routes.dart';
import '../../utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;

import '../../utils/helpers/helper_functions.dart';
import '../../utils/http/http_client.dart';

class CentersManagementController extends GetxController {
  late UserStorage storage;
  final locationDetailsController = TextEditingController();
  final centerNameController = TextEditingController();
  final centerPhoneController = TextEditingController();
  List<CityModel> cities = [];
  List<NeighborhoodModel> neighborhoodes = [];
  static final String _baseUrl = APIConstants.baseUrl;
  final isUploading = false.obs;
  RxString selectedCity = "دمشق".obs;
  late RxInt selectedCityId = 0.obs;
  late RxInt selectedNeighborhoodId = 0.obs;
  Rx<String?> selectedNeighborhood = "".obs;
  late GeoPoint currentPointPosition;
  var isLoading = false.obs;

  late double latitude, longitude;
  var listSource = <SearchInfo>[].obs;

  @override
  void onInit() {
    storage = UserStorage();
    // getCurrentLocation();
    getCities();
    super.onInit();
  }

  void setSelectedCity(String value) {
    selectedCity.value = value;
    //selectedCityId=id;
    for (int i = 0; i < cities.length; i++) {
      if (cities[i].name == value) {
        print(cities[i].id);
        selectedCityId.value = cities[i].id!;
        getNeighborhood(cityId: selectedCityId.value);
      }
    }
  }

  void setSelectedNeighborhood(String value) {
    //  neighborhoodes.clear();

    selectedNeighborhood.value = value;
    //selectedCityId=id;
    for (int i = 0; i < neighborhoodes.length; i++) {
      if (neighborhoodes[i].name == value) {
        selectedNeighborhoodId.value = neighborhoodes[i].id!;
      }
    }
  }

  Future<void> getCities() async {
    isUploading(true);
    print("getCities");
    try {
      final response = await http.get(
          Uri.parse('$_baseUrl${APIConstants.endPoints.getCities}'),
          headers: {
            'Content-Type': 'application/json',
          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> body = json.decode(response.body);

        for (int i = 0; i < body.length; i++) {
          cities.add(CityModel(id: body[i]["id"], name: body[i]["name"]));
        }
        print(cities[0].name);
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    } finally {
      isUploading(false);
    }
  }

  Future<void> getNeighborhood({required int cityId}) async {
    isUploading(true);
    print("getNeighborhood");
    try {
      final response = await http.get(
          Uri.parse(
              '$_baseUrl${APIConstants.endPoints.getNeighborhood}?cityId=$cityId'),
          headers: {
            'Content-Type': 'application/json',
          });
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List body = json.decode(response.body);

        for (int i = 0; i < body.length; i++) {
          neighborhoodes.add(
            NeighborhoodModel(
                id: body[i]["id"],
                name: body[i]["name"],
                cityId: body[i]["cityId"]),
          );
        }
        selectedNeighborhood.value = neighborhoodes[0].name;
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    } finally {
      isUploading(false);
    }
  }

  @override
  void dispose() {
    locationDetailsController.clear();
    super.dispose();
  }
/*void getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location permissions are disabled');
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      print(
          'Location permissions are permanently denied,we cannot request permissions.');
      return;
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      /*   if (permission != LocationPermission.whileInUse && permission!=) {
        print('Location permissions are denied');
        return;
      }*/
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    currentPointPosition = GeoPoint(
      latitude: currentPosition!.latitude,
      longitude: currentPosition!.longitude,
    );
    //currentPointPosition=GeoPoint(currentPosition!.latitude, currentPosition!.longitude);
    print("latitude");
    print(currentPosition?.latitude);
    latitude = currentPosition!.latitude;
    print("longitude");
    print(currentPosition?.longitude);
    longitude = currentPosition!.longitude;
  }*/
Future<void> addCenter() async {
    print("addCenter");
    try {
      Map data = {
        "neighborhoodId": selectedNeighborhoodId.value,
        "cityId": selectedCityId.value,
        "phone": centerPhoneController.text,
        "name": centerNameController.text,
        "lat": latitude,
        "long":longitude,
        "locationDescription": locationDetailsController.text
      };
      print(data);
      Map<String, dynamic> body = await THttpHelper.post(
          endpoint: APIConstants.endPoints.addCenter, data: data);
      print(body);

      centerPhoneController.clear();
      centerNameController.clear();
      locationDetailsController.clear();

      
      THelperFunctions.showSnackBar(message: 'تم إضافة السيّارة', title: '');
    } catch (e) {
      print(e);
    }finally{
      THelperFunctions.showSnackBar(message: "تم إضافة المركز", title: "إضافة مركز");
      Get.toNamed(Routes.CENTERS_MANAGEMENT);
    }
  }
}
