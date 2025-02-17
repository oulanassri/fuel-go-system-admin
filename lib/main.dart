import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:system_admin_fuel_go/routes/app_pages.dart';
import 'package:system_admin_fuel_go/screens/constants.dart';
import 'package:system_admin_fuel_go/utils/theme/theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale("ar"),
      debugShowCheckedModeBanner: false,
    //  darkTheme: TAppTheme.darkTheme,
      theme: TAppTheme.lightTheme,
      // builder:DevicePreview.appBuilder ,
    /*  theme:  ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
       /* textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        ),*/
        canvasColor: secndaryColor,

      ),*/
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
