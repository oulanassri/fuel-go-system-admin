import 'package:get/get.dart';

import '../screens/orders/orders_controller.dart';

class OrdersBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(OrdersController());
  }

}