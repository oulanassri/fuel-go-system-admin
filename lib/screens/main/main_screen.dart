import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:system_admin_fuel_go/screens/constants.dart';

import '../responsive.dart';
import '../common_components/side_menu.dart';
import '../dashboard/dashboard_screen.dart';
import 'main_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainController());
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
                flex: 2,
                child: DashboardScreen(),
              ),
              Expanded(
                flex: 3,
                child: SizedBox(
                  width: defaultPadding,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
