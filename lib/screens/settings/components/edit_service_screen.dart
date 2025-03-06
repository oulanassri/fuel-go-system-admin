import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../common_components/custom_material_button.dart';
import '../../common_components/custom_text_form_field.dart';
import '../../common_components/header.dart';
import '../../common_components/side_menu.dart';
import '../../constants.dart';
import '../../responsive.dart';
import '../settings_controller.dart';

class EditServiceScreen extends GetView<SettingsController> {
  const EditServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return Container(
      decoration: BoxDecoration(gradient: gradientColorBg),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: SideMenu(),
        body: SafeArea(
          child: Row(spacing: defaultPadding,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  child: SideMenu(),
                ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    SizedBox(
                      height: defaultPadding,
                    ),
                    Header(
                      title: 'تعديل خدمة',
                    ),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    FadeInUp(
                        duration: Duration(milliseconds: 1400),
                        child: Container(
                          padding: EdgeInsets.all(defaultPadding * 3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              CustomTextFormField(
                                hintText: "اسم الخدمة",
                                controller: controller.serviceNameController,
                              ),
                              CustomTextFormField(
                                hintText: "سعر الخدمة",
                                controller:
                                controller.servicePriceController,
                              ),

                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(defaultPadding),
                                    child: CustomMaterialButton(
                                      route: "Routes.MAIN_SCREEN",
                                      text: "إلغاء",
                                      function: () {},
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(defaultPadding),
                                    child: CustomMaterialButton(
                                      route: "Routes.MAIN_SCREEN",
                                      text: "تعديل",
                                      function: () {},
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              Expanded(child: Container())
            ],
          ),
        ),
      ),
    );
  }
}
