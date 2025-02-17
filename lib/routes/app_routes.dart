

abstract class Routes{
  Routes._();
  static const DASHBOARD=Paths.DASHBOARD;
  static const CENTERS_MANAGEMENT=Paths.CENTERS_MANAGEMENT;
  static const MAIN_SCREEN=Paths.MAIN_SCREEN;
  static const LOGIN=Paths.LOGIN;
  static const NEW_CENTER=Paths.NEW_CENTER;


  static const NEW_DRIVER=Paths.NEW_DRIVER;
  static const DRIVERS_MANAGEMENT=Paths.DRIVERS_MANAGEMENT;
}

abstract class Paths{
  Paths._();
  static const LOGIN='/login_screen';
  static const MAIN_SCREEN='/main_screen';
  static const  DASHBOARD='/dashboard_screen';

  static const CENTERS_MANAGEMENT='/centers_management_screen';
  static const NEW_CENTER='/new_center_screen';

  static const DRIVERS_MANAGEMENT='/drivers_management_screen';
  static const NEW_DRIVER='/new_driver_screen';




}