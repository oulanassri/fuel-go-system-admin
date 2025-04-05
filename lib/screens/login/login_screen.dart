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
    RxBool obscurePassword = true.obs;
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
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
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
                        Text(
                          "System Admin Login",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        CustomTextFormField(
                          hintText: "رقم الهاتف",
                          controller: controller.mobileNumberController,
                        ),
                        Obx(() => Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey.shade200),
                            ),
                          ),
                          child: TextField(
                            obscureText: obscurePassword.value,
                            controller:
                            controller.passwordController,
                            decoration: InputDecoration(
                                suffix: InkWell(
                                  child: Icon(
                                    obscurePassword.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: primaryColor,
                                    size: 20,
                                  ),
                                  onTap: () {
                                    obscurePassword.value =
                                    !(obscurePassword.value);

                                  },
                                ),
                                label: Text("أدخل كلمة السّر"),
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .titleSmall,
                                hintText: "كلمة السّر",
                                hintStyle:
                                TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                          ),
                        )),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Obx(()=>controller.isLoading.value
                              ? MaterialButton(
                            onPressed: () {},
                            height: 50,
                            // margin: EdgeInsets.symmetric(horizontal: 50),
                            color: primaryButton,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            // decoration: BoxDecoration(
                            // ),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: primaryColor,
                              ),
                            ),
                          )
                              : CustomMaterialButton(

                            text: "تسجيل دخول",
                            function: () {

                              print("login button");
                             controller.login();
                            },
                          ),),
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
