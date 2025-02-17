import 'package:get/get.dart';

import '../screens/drivers_management/drivers_management_controller.dart';


class DriversBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(DriversManagementController());
  }

}