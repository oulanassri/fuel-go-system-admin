import 'package:get/get.dart';
import '../screens/settings/settings_controller.dart';

class SettingsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SettingsController());
  }

}