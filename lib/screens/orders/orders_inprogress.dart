import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../common_components/side_menu.dart';
import '../constants.dart';
import '../responsive.dart';
import 'components/custom_orders_table.dart';
import 'order_details.dart';
import 'orders_controller.dart';

class InProgressOrdersScreen extends GetView<OrdersController> {
  InProgressOrdersScreen( {Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return Container(
      decoration: BoxDecoration(gradient: gradientColorBg),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: SideMenu(),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  child: SideMenu(),
                ),
              Expanded(
                flex: 5,
                child:CustomOrdersTable( title: "جدول الطلبات قيد الانتظار",),//CustomOrdersTable()// OrderDetails(),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
