import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:system_admin_fuel_go/models/centers.dart';

import '../../../models/city.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../utils/validators/validation.dart';
import '../../constants.dart';
import '../../common_components/header.dart';
import '../../centers_mangement/components/custom_centers_table.dart';
import '../../dashboard/components/orders_details.dart';
import '../../common_components/custom_material_button.dart';
import '../../common_components/custom_text_form_field.dart';
import '../../responsive.dart';
import '../admins_management_controller.dart';
import 'add_button1.dart';

class AddingAdminForm extends StatelessWidget {
  const AddingAdminForm({Key? key, required this.controller}) : super(key: key);
  final AdminsManagementController controller;

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
                        title: 'إضافة مسؤول',
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
                                Obx(
                                  () => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "اختر  المركز",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      DropdownButton<String>(
                                          // updated
                                          onChanged: (String? newValue) {
                                            controller.setSelectedCenter(
                                                newValue ?? '');
                                          },
                                          value:
                                              controller.selectedCenter.value,
                                          onTap: () {}, //updated
                                          items: [
                                            for (CentersModel value
                                                in controller.centersList)
                                              DropdownMenuItem(
                                                value: value.name,
                                                child: Text(
                                                  value.name ?? "",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge, //updated
                                                ),
                                              ),
                                          ]),
                                    ],
                                  ),
                                ),
                                CustomTextFormField(
                                  hintText: "الاسم ",
                                  controller: controller.nameController,
                                ),
                                CustomTextFormField(
                                  hintText: "البريد الإلكتروني",
                                  controller: controller.emailController,
                                ),
                                CustomTextFormField(
                                  hintText: "رقم الهاتف",
                                  controller: controller.phoneController,
                                ),

                                /* SizedBox(
                                  height: 40,
                                ),*/
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(defaultPadding),
                                      child: CustomMaterialButton(
                                        text: "إلغاء",
                                        function: () {
                                          Get.back();
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(defaultPadding),
                                      child: CustomMaterialButton(
                                        text: "إضافة",
                                        function: () {
                                          if (TValidator.validateEmail(
                                                  controller
                                                      .emailController.text) &&
                                              TValidator.validatePhoneNumber(
                                                  controller
                                                      .phoneController.text)) {
                                            controller.addAdmin();
                                          } else {
                                            THelperFunctions.showSnackBar(
                                                title  :
                                                    "رسالة خطأ",
                                                message: "يُرجى ملء الخانات بشكل صحيح");
                                          }
                                        },
                                      ),
                                    ),
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
