import 'package:get/get.dart';
import 'package:system_admin_fuel_go/screens/centers_mangement/centers_mangement_screen.dart';
import 'package:system_admin_fuel_go/screens/dashboard/dashboard_screen.dart';
import 'package:system_admin_fuel_go/screens/drivers_management/drivers_management_screen.dart';
import 'package:system_admin_fuel_go/screens/drivers_management/new_driver_screen.dart';
import 'package:system_admin_fuel_go/screens/main/main_screen.dart';

import '../getx_bindings/centers_binding.dart';
import '../getx_bindings/dashboard_binding.dart';
import '../getx_bindings/drivers_binding.dart';
import '../getx_bindings/login_binding.dart';
import '../getx_bindings/main_binding.dart';
import '../screens/centers_mangement/new_center_screen.dart';
import '../screens/login/login_screen.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;
  static final routes = [
    //Dashboard
    GetPage(
        name: Paths.DASHBOARD,
        page: () => const DashboardScreen(),
        binding: DashboardBinding()),
    //Centers Management
    GetPage(
        name: Paths.CENTERS_MANAGEMENT,
        page: () =>  CentersManagementScreen(),
        binding: CentersBinding()),
    //Main Screen
    GetPage(
        name: Paths.MAIN_SCREEN,
        page: () =>  MainScreen(),
        binding: MainBinding()),

    //Login Screen
    GetPage(
        name: Paths.LOGIN,
        page: () =>  LoginScreen(),
        binding: LoginBinding()),

    //New Center Screen
    GetPage(
        name: Paths.NEW_CENTER,
        page: () =>  NewCenterScreen(),
        binding: CentersBinding()),

    //Drivers Management
    GetPage(
        name: Paths.DRIVERS_MANAGEMENT,
        page: () =>  DriversManagementScreen(),
        binding: DriversBinding()),
    //New Driver Screen
    GetPage(
        name: Paths.NEW_DRIVER,
        page: () =>  NewDriverScreen(),
        binding: DriversBinding()),

  ];
}
