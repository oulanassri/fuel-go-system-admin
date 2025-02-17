import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import '../../native_service/get_storage.dart';

class CentersManagementController extends GetxController {
  late UserStorage storage;
  final locationController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    storage = UserStorage();
    super.onInit();
  }

}