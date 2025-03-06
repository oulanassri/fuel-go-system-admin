

abstract class Routes{
  Routes._();
  static const DASHBOARD=Paths.DASHBOARD;
  static const CENTERS_MANAGEMENT=Paths.CENTERS_MANAGEMENT;
  static const MAIN_SCREEN=Paths.MAIN_SCREEN;
  static const LOGIN=Paths.LOGIN;
  static const NEW_CENTER=Paths.NEW_CENTER;

  static const ORDERS_UPCOMING_SCREEN=Paths.ORDERS_UPCOMING_SCREEN;
  static const ORDERS_INPROGRESS_SCREEN=Paths.ORDERS_INPROGRESS_SCREEN;
  static const ORDERS_COMPLETED_SCREEN=Paths.ORDERS_COMPLETED_SCREEN;
  static const ORDERS_CANCELLED_SCREEN=Paths.ORDERS_CANCELLED_SCREEN;
  static const ORDER_DETAILS=Paths.ORDER_DETAILS;

  static const NEW_ADMIN=Paths.NEW_ADMIN;
  static const ADMINS_MANAGEMENT=Paths.ADMINS_MANAGEMENT;

  static const SETTINGS_SCREEN=Paths.SETTINGS_SCREEN;
  static const EDIT_SERVICE_SCREEN=Paths.EDIT_SERVICE_SCREEN;
}

abstract class Paths{
  Paths._();
  static const LOGIN='/login_screen';
  static const MAIN_SCREEN='/main_screen';
  static const  DASHBOARD='/dashboard_screen';

  static const CENTERS_MANAGEMENT='/centers_management_screen';
  static const NEW_CENTER='/new_center_screen';

  static const ADMINS_MANAGEMENT='/admins_management_screen';
  static const NEW_ADMIN='/new_admin_screen';

  static const ORDERS_UPCOMING_SCREEN='/orders_upcoming';
  static const ORDERS_INPROGRESS_SCREEN='/orders_inprogress';
  static const ORDERS_COMPLETED_SCREEN='/orders_completed';
  static const ORDERS_CANCELLED_SCREEN='/orders_cancelled';
  static const ORDER_DETAILS='/order_details_screen';

  static const SETTINGS_SCREEN='/settings_screen';
  static const EDIT_SERVICE_SCREEN='/edit_service_screen';

}