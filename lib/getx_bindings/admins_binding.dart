import 'package:get/get.dart';

import '../screens/admins_management/admins_management_controller.dart';


class AdminsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AdminsManagementController());
  }

}