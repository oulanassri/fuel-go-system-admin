import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../native_service/get_storage.dart';

class SettingsController extends GetxController {
  late UserStorage storage;

   final serviceNameController = TextEditingController();
   final servicePriceController = TextEditingController();
  // RxString selectedFuelType = "gas".obs;
  // final fuelTypeList=['gas', 'gas1', 'gas2','gas3', ];
  TimeOfDay time=TimeOfDay(hour: 7, minute: 30);

  @override
  void onInit() {
    storage = UserStorage();
    super.onInit();
  }

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 7, minute: 30);
    final newTime = await showTimePicker(
        context: context, initialTime: time ?? initialTime);
  }
// void setSelectedFuelType(String value){
//   selectedFuelType.value = value;
//
//   update();
// }
}