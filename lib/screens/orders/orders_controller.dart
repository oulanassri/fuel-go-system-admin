import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import '../../native_service/get_storage.dart';

class OrdersController extends GetxController {
  late UserStorage storage;
  // final plateNumberController = TextEditingController();
  // final fuelTypeController = TextEditingController();
  // RxString selectedFuelType = "gas".obs;
  // final fuelTypeList=['gas', 'gas1', 'gas2','gas3', ];

  @override
  void onInit() {

    storage = UserStorage();
    super.onInit();
  }
  // void setSelectedFuelType(String value){
  //   selectedFuelType.value = value;
  //
  //   update();
  // }
}