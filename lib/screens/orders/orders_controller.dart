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
  List orderStatusList = [
    "تم التسليم",
    "قيد الانتظار",
    "مقبول",
    "في الطريق",
    "وصل للموقع",
    "بدء تعبئة الطلب",

  ].obs;
  RxString selectedOrderStatus = "تم التسليم".obs;
 // late RxInt selectedOrderStatusId = 0.obs;
  @override
  void onInit() {
    getAllOrders();
    super.onInit();
  }

  void setSelectedOrderStatusCenter(String value) {
    selectedOrderStatus.value = value;
    getAllOrders();
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
        print("response.statusCode ${response.statusCode}");
        print("response.statusCode ${response.body}");
        orders.clear();
        for (int i = 0; i < body.length; i++) {
          print("********************");
          print(body[i]["statusName"].toString());
       //  if(body[i]["statusName"].toString()==selectedOrderStatus.value) {
           orders.add(
            OrdersModel(
              date: body[i]["date"].toString()=="null"?"--":body[i]["date"].toString(),
              orderNumber: body[i]["orderNumber"].toString()=="null"?"--":body[i]["orderNumber"].toString(),
              locationDescription: body[i]["locationDescription"].toString()=="null"?"--":body[i]["locationDescription"].toString(),
              neighborhoodName: body[i]["neighborhoodName"].toString()=="null"?"--":body[i]["neighborhoodName"].toString(),
              fuelTypeName: body[i]["fuelTypeName"].toString()=="null"?"--":body[i]["fuelTypeName"].toString(),
              orderedQuantity: body[i]["orderedQuantity"].toString()=="null"?"--":body[i]["orderedQuantity"].toString(),
              price: body[i]["price"].toString()=="null"?"--":body[i]["price"].toString(),
              finalQuantity: body[i]["finalQuantity"].toString()=="null"?"--":body[i]["finalQuantity"].toString(),
              finalPrice: body[i]["finalPrice"].toString()=="null"?"--":body[i]["finalPrice"].toString(),
              customerCarBrand: body[i]["customerCarBrand"].toString()=="null"?"--":body[i]["customerCarBrand"].toString(),
              customerApartmentName:
                  body[i]["customerApartmentName"].toString()=="null"?"--":body[i]["customerApartmentName"].toString(),
              authCode: body[i]["authCode"].toString()=="null"?"--":body[i]["authCode"].toString(),
              statusName: body[i]["statusName"].toString()=="null"?"--":body[i]["statusName"].toString(),
              customerName: body[i]["customerName"].toString()=="null"?"--":body[i]["customerName"].toString(),
              customerPhone: body[i]["customerPhone"].toString()=="null"?"--":body[i]["customerPhone"].toString(),
              driverName: body[i]["driverName"].toString()=="null"?"--":body[i]["driverName"].toString(),
              driverPhone: body[i]["driverPhone"].toString()=="null"?"--":body[i]["driverPhone"].toString(),
              deliveryFee: body[i]["deliveryFee"].toString()=="null"?"--":body[i]["deliveryFee"].toString(),
              centerName: body[i]["centerName"].toString()=="null"?"--":body[i]["centerName"].toString(),
            ),
          );
        // }
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
