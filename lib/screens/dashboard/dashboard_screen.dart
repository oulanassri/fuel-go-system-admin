import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants.dart';
import '../responsive.dart';
import 'components/drivers_amount.dart';
import '../common_components/header.dart';
import '../centers_mangement/components/custom_centers_table.dart';
import 'components/orders_details.dart';
import 'components/orders_amount.dart';
import 'dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
mainAxisSize: MainAxisSize.max,
          children: [
            Header(
              title: "لوحة التحكم",
            ),
            SizedBox(
              height: defaultPadding,
            ),
            Center(
              child: Image.asset(
                "assets/images/Dashboard.png",
                fit: BoxFit.cover,

              ),
            ),
           /* DriversAmount(title: 'عدد السّائقين', svgSrc: '', numOfDrivers: 50,),
            SizedBox(
              height: defaultPadding,
            ),
            OrdersDetails(),*/

          ],
        ),
      ),
    );
  }
}
