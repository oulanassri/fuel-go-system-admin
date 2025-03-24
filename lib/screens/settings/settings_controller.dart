import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../models/fuel_details.dart';
import '../../native_service/get_storage.dart';
import '../../routes/app_routes.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/helpers/helper_functions.dart';

class SettingsController extends GetxController {
  final String token = UserStorage.read('token');

  RxList fuelDetail = [].obs;
  var isLoading = false.obs;
  late String fuelType;

  final serviceNameController = TextEditingController();
  final servicePriceController = TextEditingController();

  // RxString selectedFuelType = "gas".obs;
  // final fuelTypeList=['gas', 'gas1', 'gas2','gas3', ];
  TimeOfDay time = TimeOfDay(hour: 7, minute: 30);

  @override
  void onInit() {
    getFuelDetails();
    super.onInit();
  }

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 7, minute: 30);
    final newTime = await showTimePicker(
        context: context, initialTime: time ?? initialTime);
  }

  Future<void> getFuelDetails() async {
    print("getFuelDetails");
    try {
      isLoading(true);
      final response = await http.get(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.getFuelDetails}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'

          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> body = json.decode(response.body);

        for (int i = 0; i < body.length; i++) {
          fuelDetail.add(FuelDetailsModel(
            id: body[i]["id"],
            fuelTypeName: body[i]["fuelTypeName"],
            centerName: body[i]["centerName"],
            price: body[i]["price"],
          ));
        }
        print(fuelDetail[0].name);
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
        "key": fuelType,
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
        fuelDetail.clear();
        getFuelDetails();
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
