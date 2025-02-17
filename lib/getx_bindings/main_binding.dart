import 'package:get/get.dart';

import '../screens/main/main_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MainController());
  }

}