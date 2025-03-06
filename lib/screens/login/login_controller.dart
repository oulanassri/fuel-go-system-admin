import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import '../../native_service/get_storage.dart';
import '../../routes/app_routes.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/http/http_client.dart';

class LoginController extends GetxController {
  late UserStorage storage;
  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    storage = UserStorage();
    super.onInit();
  }

  Future<void> login() async {
    print("login call");
    try {
      Map data = {
        "phone": mobileNumberController.text,
        "password": passwordController.text
      };
      Map<String, dynamic> body =
          await THttpHelper.post("https://172.0.0.1:7270/api/User/login", data);
      print(body);
      //  storage.save("token", value);
      mobileNumberController.clear();
      passwordController.clear();
      Get.offNamed(Routes.DASHBOARD);
    } catch (e) {
      print(e);
    }
  }
}
