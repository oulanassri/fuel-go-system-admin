import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:system_admin_fuel_go/screens/constants.dart';
import '../common_components/side_menu.dart';
import '../responsive.dart';
import 'components/drivers_table.dart';
import 'drivers_management_controller.dart';

class DriversManagementScreen extends StatelessWidget {
  const DriversManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DriversManagementController());
    return Container(
      decoration: BoxDecoration(gradient: gradientColorBg),
      child: Scaffold(backgroundColor: Colors.transparent,
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
                child: DriversTable(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
