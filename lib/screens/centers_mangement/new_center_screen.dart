import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:system_admin_fuel_go/screens/constants.dart';
import '../common_components/side_menu.dart';
import '../responsive.dart';
import 'centers_managment_controller.dart';
import 'components/adding_center_widget.dart';
import 'components/centers_table.dart';

class NewCenterScreen extends GetView<CentersManagementController> {
  const NewCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CentersManagementController());
    return Container(
      decoration: BoxDecoration(gradient: gradientColorBg),
      child: Scaffold(backgroundColor: Colors.transparent,
        drawer: SideMenu(),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context)||Responsive.isTablet(context))
                Expanded(
                  child: SideMenu(),
                ),
              Expanded(
                flex: 5,
                child: AddingCenterWidget(
                  controller: controller,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
