import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:system_admin_fuel_go/screens/constants.dart';

import '../../native_service/get_storage.dart';
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
            DrawerMultiListTile(
              title: 'إدارة الطلبات',
              svgSrc: 'assets/icons/menu_tran.svg',
            ),

            DrawerListTile(
              title: 'إدارة المسؤولين',
              svgSrc: 'assets/icons/menu_doc.svg',
              press: () { Get.toNamed(Routes.ADMINS_MANAGEMENT);},
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
              press: () { Get.toNamed(Routes.SETTINGS_SCREEN);},
            ),
            DrawerListTile(
              title: 'تسجيل خروج',
              svgSrc: 'assets/icons/menu_notification.svg',
              press: () {  UserStorage.delete('token');

              Get.offNamed(Routes.LOGIN); },
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
class DrawerMultiListTile extends StatelessWidget {
  DrawerMultiListTile({
    super.key,
    required this.title,
    required this.svgSrc,
  });

  final String title, svgSrc;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      children: [
        DrawerListTile(
          title: 'الطلبات القادمة',
          svgSrc: 'assets/icons/menu_notification.svg',
          press: () {
            Get.toNamed(Routes.ORDERS_UPCOMING_SCREEN);
          },
        ),
        DrawerListTile(
          title: 'الطلبات قيد التّنفيذ',
          svgSrc: 'assets/icons/menu_notification.svg',
          press: () {

            Get.toNamed(Routes.ORDERS_INPROGRESS_SCREEN);
          },
        ),
        DrawerListTile(
          title: 'الطلبات المكتملة',
          svgSrc: 'assets/icons/menu_notification.svg',
          press: () {

            Get.toNamed(Routes.ORDERS_COMPLETED_SCREEN);
          },
        ),
        DrawerListTile(
          title: 'الطلبات الملغاة',
          svgSrc: 'assets/icons/menu_notification.svg',
          press: () {

            Get.toNamed(Routes.ORDERS_CANCELLED_SCREEN);
          },
        ),
      ],
    );
  }
}