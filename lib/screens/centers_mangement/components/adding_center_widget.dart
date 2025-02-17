import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../common_components/header.dart';
import 'custom_centers_table.dart';
import '../../dashboard/components/orders_details.dart';
import '../../common_components/custom_material_button.dart';
import '../../common_components/custom_text_form_field.dart';
import '../../responsive.dart';
import '../centers_managment_controller.dart';
import 'add_button.dart';

class AddingCenterWidget extends StatelessWidget {
  const AddingCenterWidget({Key? key, required this.controller})
      : super(key: key);
  final CentersManagementController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            SizedBox(
              height: defaultPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Header(
                        title: 'إضافة مركز',
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
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                CustomTextFormField(
                                  hintText: "موقع المركز",
                                  controller: controller.locationController,
                                ),

                                CustomTextFormField(
                                  hintText: "كلمة السر",
                                  controller: controller.passwordController,
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


                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(defaultPadding),
                                      child: CustomMaterialButton(
                                        route: "Routes.MAIN_SCREEN",
                                        text: "إضافة",

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
                Expanded(flex: 1, child: SizedBox())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
