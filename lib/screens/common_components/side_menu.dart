import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:system_admin_fuel_go/screens/constants.dart';

import '../../routes/app_routes.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,
      elevation: 20,
      surfaceTintColor: primaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/logo.png"),
            ),
            DrawerListTile(
              title: 'لوحة التّحكم',
              svgSrc: 'assets/icons/menu_dashboard.svg',
              press: () { Get.toNamed(Routes.MAIN_SCREEN);},
            ),
            DrawerListTile(
              title: 'إدارة الطلبات',
              svgSrc: 'assets/icons/menu_tran.svg',
              press: () {},
            ),
            DrawerListTile(
              title: 'إدارة المحفظات',
              svgSrc: 'assets/icons/menu_task.svg',
              press: () {},
            ),
            DrawerListTile(
              title: 'إدارة السّائقين',
              svgSrc: 'assets/icons/menu_doc.svg',
              press: () { Get.toNamed(Routes.DRIVERS_MANAGEMENT);},
            ),
            DrawerListTile(
              title: 'إدارة الشاحنات',
              svgSrc: 'assets/icons/menu_store.svg',
              press: () {},
            ),
            DrawerListTile(
              title: 'إدارة المراكز',
              svgSrc: 'assets/icons/menu_notification.svg',
              press: () {
                Get.toNamed(Routes.CENTERS_MANAGEMENT);
              },
            ),
            DrawerListTile(
              title: 'الإعدادات',
              svgSrc: 'assets/icons/menu_notification.svg',
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.svgSrc,
    required this.press,
  });

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
