import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:system_admin_fuel_go/screens/constants.dart';
import '../common_components/side_menu.dart';
import '../responsive.dart';
import 'admins_management_controller.dart';
import 'components/adding_admin_form.dart';

class NewAdminScreen extends GetView<AdminsManagementController> {
   NewAdminScreen({Key? key}) : super(key: key);
  @override
  AdminsManagementController controller=  Get.find<AdminsManagementController>();

  @override
  Widget build(BuildContext context) {
    controller.getCenters();
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
                child: AddingAdminForm(
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
