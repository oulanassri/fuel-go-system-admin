import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import '../../native_service/get_storage.dart';
import '../../routes/app_routes.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/http/http_client.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  late UserStorage storage;
  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();
  static final String _baseUrl = APIConstants.baseUrl;

  @override
  void onInit() {
    storage = UserStorage();
    super.onInit();
  }

  Future<void> login() async {
    print("login");
    try {
      Map data = {
        "password": passwordController.text,
        "phone": mobileNumberController.text,
      };
      print(data);

      final response =
          await http.post(Uri.parse('$_baseUrl${APIConstants.endPoints.login}'),
              headers: {
                'Content-Type': 'application/json',
                "Access-Control-Allow-Origin": "*",
                "Access-Control-Allow-Methods": "POST",
              },
              body: json.encode(data));
      if (response.statusCode == 200) {
        print("response.statusCode  ${response.statusCode}");
       final body=  json.decode(response.body);
        print(body["token"]);
        //  print(json.decode(body["token"] ));
        UserStorage.save("token", body["token"]);
        UserStorage.save("phone", mobileNumberController.text);
        mobileNumberController.clear();
        passwordController.clear();

        Get.offNamed(Routes.MAIN_SCREEN);
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }

    } catch (e) {
      print(e);
    }
  }
}
