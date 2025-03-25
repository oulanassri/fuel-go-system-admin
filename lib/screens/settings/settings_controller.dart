import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../models/constant_values.dart';
import '../../native_service/get_storage.dart';
import '../../routes/app_routes.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/helpers/helper_functions.dart';

class SettingsController extends GetxController {
  final String token = UserStorage.read('token');

  RxList constantValues = [].obs;
  var isLoading = false.obs;
  late String constantValuesKey;

  final serviceNameController = TextEditingController();
  final servicePriceController = TextEditingController();

  // RxString selectedFuelType = "gas".obs;
  // final fuelTypeList=['gas', 'gas1', 'gas2','gas3', ];
  TimeOfDay time = TimeOfDay(hour: 7, minute: 30);

  @override
  void onInit() {
    getConstantValues();
    super.onInit();
  }
  @override
  void onReady() {
    getConstantValues();
    super.onReady();
  }
  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 7, minute: 30);
    final newTime = await showTimePicker(
        context: context, initialTime: time ?? initialTime);
  }

  Future<void> getConstantValues() async {
    print("getConstantValues");
    try {
      isLoading(true);
      final response = await http.get(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.getConstantValues}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'

          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> body = json.decode(response.body);
        constantValues.clear();
        for (int i = 0; i < body.length; i++) {
          constantValues.add(ConstantValuesModel(
            id: body[i]["id"],
            key: body[i]["key"],
            value: body[i]["value"],
          ));
        }
        print(constantValues[0].name);
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
  Future<void> editContantValue() async {
    print("editContantValue");
    try {
      Map data = {
        "key": constantValuesKey,
        "value": int.parse(servicePriceController.text)
      };
      print(data);
      final response = await http.post(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.editContantValue}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: json.encode([data]));

      print("response.statusCode  ${response.statusCode}");
      print("response.body  ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        constantValues.clear();
        getConstantValues();
        THelperFunctions.showSnackBar(
            message: 'تم تعديل الإعدادات', title: 'تعديل الإعدادات');
        Get.toNamed(Routes.SETTINGS_SCREEN);
      //  Get.toNamed(Routes.SETTINGS_SCREEN);
      }
      //getProperties();
      //Get.back();
      //THelperFunctions.showSnackBar(message: 'تم إضافة السيّارة', title: '');
    } catch (e) {
      print(e);
    }
  }
// void setSelectedFuelType(String value){
//   selectedFuelType.value = value;
//
//   update();
// }
}
