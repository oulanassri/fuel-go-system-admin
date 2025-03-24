import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import '../../models/orders.dart';
import '../../native_service/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../utils/constants/api_constants.dart';

class OrdersController extends GetxController {
  static final String token = UserStorage.read('token');

  var isLoading = false.obs;
  List<OrdersModel> orders = [];

  @override
  void onInit() {
    getAllOrders();
    super.onInit();
  }

  Future<void> getAllOrders() async {
    print("getAllOrders");
    try {
      isLoading(true);

      final response = await http.get(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.getAllOrders}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> body = json.decode(response.body);

        for (int i = 0; i < body.length; i++) {
          orders.add(
            OrdersModel(
              date: body[i]["date"],
              orderNumber: body[i]["orderNumber"],
              locationDescription: body[i]["locationDescription"],
              neighborhoodName: body[i]["neighborhoodName"],
              fuelTypeName: body[i]["fuelTypeName"],
              orderedQuantity: body[i]["orderedQuantity"],
              price: body[i]["price"],
              finalQuantity: body[i]["finalQuantity"],
              finalPrice: body[i]["finalPrice"],
              customerCarBrand: body[i]["customerCarBrand"],
              customerApartmentName: body[i]["customerApartmentName"],
              authCode: body[i]["authCode"],
            ),
          );
        }
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
      //Get.back();
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

// void setSelectedFuelType(String value){
//   selectedFuelType.value = value;
//
//   update();
// }
}
