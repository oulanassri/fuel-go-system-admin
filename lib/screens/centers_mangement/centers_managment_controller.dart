import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import '../../models/centers.dart';
import '../../models/city.dart';
import '../../models/neighborhood.dart';
import '../../native_service/get_storage.dart';
import '../../routes/app_routes.dart';
import '../../utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;

import '../../utils/helpers/helper_functions.dart';
import '../../utils/http/http_client.dart';

class CentersManagementController extends GetxController {
   final String token = UserStorage.read('token');

  final locationDetailsController = TextEditingController();
  final centerNameController = TextEditingController();
  final centerPhoneController = TextEditingController();
   RxList cities = [].obs;
  RxList centersList = [].obs;

   RxList neighborhoodes = [].obs;
  static final String _baseUrl = APIConstants.baseUrl;
  RxString selectedCity = "دمشق".obs;
  late RxInt selectedCityId = 1.obs;
  late RxInt selectedNeighborhoodId = 1.obs;
  Rx<String?> selectedNeighborhood = "".obs;
  late GeoPoint currentPointPosition;
  var isLoading = false.obs;

  late double latitude, longitude;
  var listSource = <SearchInfo>[].obs;

  @override
  void onInit() {
    // getCurrentLocation();
    getCenters();
    getCities();
    getNeighborhood(cityId: 1);
    super.onInit();
  }
   @override
   void onReady() {
     // getCurrentLocation();
    // getCenters();
    // getCities();
    // getNeighborhood(cityId: 1);
     super.onReady();
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

  Future<void> getCenters() async {

    print("getCenters");
    try {  isLoading(true);
      final response = await http.get(
          Uri.parse('$_baseUrl${APIConstants.endPoints.getCenters}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> body = json.decode(response.body);
        centersList.clear();
        for (int i = 0; i < body.length; i++) {
          centersList.add(
            CentersModel(
              id: body[i]["id"],
              neighborhoodName: body[i]["neighborhoodName"] ,
              phone: body[i]["phone"],
              name: body[i]["name"],
              lat: body[i]["lat"],
              long: body[i]["long"],
              locationDescription: body[i]["locationDescription"],
            ),
          );
        }
        print(centersList[0].name);
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getCities() async {

    print("getCities");
    try { isLoading(true);
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
      isLoading(false);
    }
  }

  Future<void> getNeighborhood({required int cityId}) async {

    print("getNeighborhood");
    try { isLoading(true);
      final response = await http.get(
          Uri.parse(
              '$_baseUrl${APIConstants.endPoints.getNeighborhood}?cityId=$cityId'),
          headers: {
            'Content-Type': 'application/json',

          });
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List body = json.decode(response.body);
        neighborhoodes.clear();
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
      isLoading(false);
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
        "long": longitude,
        "locationDescription": locationDetailsController.text
      };
      print(data);
      final response = await http.post(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.addCenter}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: json.encode(data));

      if (response.statusCode == 201 || response.statusCode == 200) {
        print("response.statusCode ${response.statusCode}");
        centerPhoneController.clear();
        centerNameController.clear();
        locationDetailsController.clear();
        THelperFunctions.showSnackBar(
            message: "تم إضافة المركز بنجاح", title: "إضافة مركز");
       // return json.decode(response1.body);
      } else {    THelperFunctions.showSnackBar(
          message: "حدث خطأ أثناء إضافة المركز", title: "إضافة مركز");
        print('Failed to load date: ${response.body}');
        throw Exception('Failed to load date: ${response.statusCode}');
      }

    } catch (e) {
      THelperFunctions.showSnackBar(
          message: "حدث خطأ أثناء إضافة المركز", title: "إضافة مركز");
      if (kDebugMode) {
        print(e);
      }
    } finally {

      getCenters();
      Get.toNamed(Routes.CENTERS_MANAGEMENT);
    }
  }
}
