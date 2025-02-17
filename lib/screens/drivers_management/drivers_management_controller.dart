import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import '../../native_service/get_storage.dart';

class DriversManagementController extends GetxController {
  late UserStorage storage;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final lorryNumberController = TextEditingController();
  final plateNumberController = TextEditingController();
  final shiftsList=['shift1', 'shift2', 'shift3','shift4', 'shift5', 'shift6',];
  final plateNumbersList=['plate1', 'plate2', 'plate3'];
  RxString selectedShift = "shift1".obs;
  RxString selectedPlateNumber = "plate1".obs;

  @override
  void onInit() {
    storage = UserStorage();
    super.onInit();
  }
  void setSelectedSift(String value){
    selectedShift.value = value;

    update();
  }

  void setSelectedPlateNumber(String value){
    selectedPlateNumber.value = value;
    update();
  }
}