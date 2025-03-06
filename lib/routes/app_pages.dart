import 'package:get/get.dart';
import 'package:system_admin_fuel_go/screens/centers_mangement/centers_mangement_screen.dart';
import 'package:system_admin_fuel_go/screens/dashboard/dashboard_screen.dart';
import 'package:system_admin_fuel_go/screens/main/main_screen.dart';

import '../getx_bindings/admins_binding.dart';
import '../getx_bindings/centers_binding.dart';
import '../getx_bindings/dashboard_binding.dart';
import '../getx_bindings/login_binding.dart';
import '../getx_bindings/main_binding.dart';
import '../getx_bindings/orders_binding.dart';
import '../getx_bindings/settings_binding.dart';
import '../screens/admins_management/admins_management_screen.dart';
import '../screens/admins_management/new_admin_screen.dart';
import '../screens/centers_mangement/new_center_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/orders/order_details.dart';
import '../screens/orders/orders_cancelled.dart';
import '../screens/orders/orders_completed.dart';
import '../screens/orders/orders_inprogress.dart';
import '../screens/orders/orders_upcoming.dart';
import '../screens/settings/components/edit_service_screen.dart';
import '../screens/settings/settings_screen.dart';
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
        name: Paths.ADMINS_MANAGEMENT,
        page: () =>  AdminsManagementScreen(),
        binding: AdminsBinding()),
    //New Admin Screen
    GetPage(
        name: Paths.NEW_ADMIN,
        page: () =>  NewAdminScreen(),
        binding: AdminsBinding()),
    //Settings Screen
    GetPage(
        name: Paths.SETTINGS_SCREEN,
        page: () => SettingsScreen(),
        binding: SettingsBinding()),
    //Edit Service Screen
    GetPage(
        name: Paths.EDIT_SERVICE_SCREEN,
        page: () => EditServiceScreen(),
        binding: SettingsBinding()),
    //Orders Screens
    GetPage(
        name: Paths.ORDERS_UPCOMING_SCREEN,
        page: () => UpcomingOrdersScreen(),
        binding: OrdersBinding()),
    GetPage(
        name: Paths.ORDERS_INPROGRESS_SCREEN,
        page: () => InProgressOrdersScreen(),
        binding: OrdersBinding()),
    GetPage(
        name: Paths.ORDERS_CANCELLED_SCREEN,
        page: () => CancelledOrdersScreen(),
        binding: OrdersBinding()),
    GetPage(
        name: Paths.ORDERS_COMPLETED_SCREEN,
        page: () => CompletedOrdersScreen(),
        binding: OrdersBinding()),

    //Order Details Screen
    GetPage(
        name: Paths.ORDER_DETAILS,
        page: () => OrderDetails(),
        binding: OrdersBinding()),

  ];
}
