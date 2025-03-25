import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import '../../models/admin.dart';
import '../../models/centers.dart';
import '../../native_service/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../routes/app_routes.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/http/http_client.dart';

class AdminsManagementController extends GetxController {
  final String token = UserStorage.read('token');

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final centerNameController = TextEditingController();
  final plateNumberController = TextEditingController();
  RxString selectedShift = "shift1".obs;
  RxString selectedPlateNumber = "plate1".obs;
 // RxList cities = [].obs;
  RxList admins = [].obs;
  var isLoading = false.obs;
  RxString selectedCenter = "".obs;
  late RxInt selectedCenterId = 1.obs;
  List<CentersModel> centersList = [];

  @override
  void onInit() {
    getCenters();
    getAdmins();
    super.onInit();
  }
  @override
  void onReady() {
    // getCurrentLocation();
    getCenters();
    getAdmins();
    super.onReady();
  }
  void setSelectedCenter(String value) {
    selectedCenter.value = value;
    //selectedCityId=id;
    for (int i = 0; i < centersList.length; i++) {
      if (centersList[i].name == value) {
        print(centersList[i].id);
        selectedCenterId.value = centersList[i].id!;
        admins.clear();
        getAdmins();
      }
    }
  }

  void setSelectedSift(String value) {
    selectedShift.value = value;
  }

  void setSelectedPlateNumber(String value) {
    selectedPlateNumber.value = value;
  }

  /*Future<void> getCities() async {
    print("getCities");
    try {
      isLoading(true);
      final response = await http.get(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.getCities}'),
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
  }*/
  Future<void> getCenters() async {

    print("getCenters");
    try {  isLoading(true);
    final response = await http.get(
        Uri.parse('${APIConstants.baseUrl}${APIConstants.endPoints.getCenters}'),
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
      selectedCenter.value=centersList[0].name??"";
      selectedCenterId.value=centersList[0].id!;
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
  Future<void> getAdmins() async {
    print("getAdmins");
    try {
      isLoading(true);
      final response = await http.get(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.getAdminsByCneter}?centerId=${selectedCenterId.value}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'

          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> body = json.decode(response.body);
        admins.clear();
        for (int i = 0; i < body.length; i++) {
          admins.add(AdminModel(
            id: body[i]["id"],
            name: body[i]["name"],
            phone: body[i]["phone"],
            statusName: body[i]["statusName"],
          ));
        }
        print(admins[0].name);
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> addAdmin() async {
    print("addAdmin");
    try {
      Map data = {
        "name": nameController.text,
        "phone": phoneController.text,
        "email": emailController.text,
        "centerId": selectedCenterId.value
      };
      print(data);
      final response  = await THttpHelper.post(
          endpoint: APIConstants.endPoints.addAdmin, data: data);
      http.Response response1=response as http.Response;
      if (response1.statusCode == 201 || response1.statusCode == 200) {
        print("response.statusCode ${response1.statusCode}");
        nameController.clear();
        phoneController.clear();
        emailController.clear();
        THelperFunctions.showSnackBar(
            message: "تم المسؤول", title: "إضافة مسؤول");
        // return json.decode(response1.body);
      } else {
        throw Exception('Failed to load date: ${response1.statusCode}');
      }

    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {

      getAdmins();
      Get.toNamed(Routes.ADMINS_MANAGEMENT);
    }
  }
}
