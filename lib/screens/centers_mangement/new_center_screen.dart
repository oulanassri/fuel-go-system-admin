import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:system_admin_fuel_go/screens/constants.dart';
import '../common_components/side_menu.dart';
import '../responsive.dart';
import 'centers_managment_controller.dart';
import 'components/adding_center_widget.dart';
import 'components/centers_table.dart';

class NewCenterScreen extends GetView<CentersManagementController> {
  const NewCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CentersManagementController());
    return Container(
      decoration: BoxDecoration(gradient: gradientColorBg),
      child: Scaffold(backgroundColor: Colors.transparent,
        drawer: SideMenu(),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context)||Responsive.isTablet(context))
                Expanded(
                  child: SideMenu(),
                ),
              Expanded(
                flex: 5,
                child: AddingCenterWidget(
                  controller: controller,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
 if(controller.latitude==0) {
                                        THelperFunctions.showSnackBar(
                                            message:
                                            "يُرجى اختيار موقع من المواقع المقترحة في الحقل السّابق",
                                            title: "رسالة خطأ");
                                      } */
/*function: () {
                                          if (TValidator.isValidateName(
                                                  controller
                                                      .centerNameController
                                                      .text) &&
                                              TValidator.isValidatePhoneNumber(
                                                  controller
                                                      .centerPhoneController
                                                      .text) &&
                                              (controller
                                                      .locationDetailsController
                                                      .text
                                                      .length >
                                                  2) &&
                                              (controller.longitude > 0 )) {
                                            controller.addCenter();
                                          } else {
                                            String? message1 = "",
                                                message2 = "",
                                                message3 = "",message4="";
                                            if (!(TValidator.isValidateName(
                                                controller.centerNameController
                                                    .text))) {
                                              message1 =
                                                  TValidator.validateName(
                                                      controller
                                                          .centerNameController
                                                          .text);
                                            }
                                            if (!(TValidator
                                                .isValidatePhoneNumber(
                                                    controller
                                                        .centerPhoneController
                                                        .text))) {
                                              message2 = TValidator
                                                  .validatePhoneNumber(
                                                      controller
                                                          .centerPhoneController
                                                          .text);
                                            }
                                            if ((controller
                                                    .locationDetailsController
                                                    .text
                                                    .length <
                                                6)) {
                                              message3 =
                                                  "العنوان قصير جدا و غير واضح";
                                            }
                                            if(controller.longitude== 0)
                                              message4="longitude== 0";
                                            THelperFunctions.showSnackBar(
                                                title: "رسالة خطأ",
                                                message:
                                                    "$message1 , $message2 , $message3 , $message4");
                                          }
                                        },*/