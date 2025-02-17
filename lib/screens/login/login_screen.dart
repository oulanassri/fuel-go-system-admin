import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:system_admin_fuel_go/screens/constants.dart';

import '../../routes/app_routes.dart';
import '../responsive.dart';
import '../dashboard/dashboard_screen.dart';
import '../common_components/custom_material_button.dart';
import '../common_components/custom_text_form_field.dart';
import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Container(
      decoration: BoxDecoration(gradient: gradientColorBg),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.cover,
                  width: 200,
                ),
              ),

              FadeInUp(
                  duration: Duration(milliseconds: 1400),
                  child: Container(width: MediaQuery.of(context).size.width/2,
                    padding: EdgeInsets.all(defaultPadding * 2),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFFBABABA),
                              blurRadius: 20,
                              offset: Offset(0, 10))
                        ]),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CustomTextFormField(
                          hintText: "رقم الهاتف",
                          controller: controller.mobileNumberController,
                        ),
                        CustomTextFormField(
                          hintText: "كلمة السّر",
                          controller: controller.passwordController,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: CustomMaterialButton(
                            route: Routes.MAIN_SCREEN,
                            text: "تسجيل دخول",


                          ),
                        )
                      ],
                    ),
                  )),
              SizedBox(
                width: defaultPadding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
