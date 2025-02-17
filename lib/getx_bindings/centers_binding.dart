import 'package:get/get.dart';

import '../screens/centers_mangement/centers_managment_controller.dart';


class CentersBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(CentersManagementController());
  }

}