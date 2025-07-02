import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../models/city.dart';
import '../../../models/neighborhood.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../utils/validators/validation.dart';
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
  AddingCenterWidget({Key? key, required this.controller}) : super(key: key);
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
                            child: Column(spacing: defaultPadding,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Obx(
                                      () => Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "اختر  المحافظة",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      DropdownButton<String>(
                                        // updated
                                          onChanged: (String? newValue) {
                                            controller.setSelectedCity(
                                                newValue ?? '');
                                          },
                                          value: controller.selectedCity.value,
                                          onTap: () {}, //updated
                                          items: [
                                            for (CityModel value
                                            in controller.cities)
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
                                Obx(
                                      () => controller.selectedCityId.value > 0
                                      ? Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "اختر الحيّ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      DropdownButton(
                                        // updated
                                          onChanged: (String? newValue) {
                                            controller
                                                .setSelectedNeighborhood(
                                                newValue ?? '');
                                          },
                                          value: controller
                                              .selectedNeighborhood.value,
                                          onTap: () {}, //updated
                                          items: [
                                            for (NeighborhoodModel value
                                            in controller
                                                .neighborhoodes)
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
                                  )
                                      : Container(),
                                ),
                                CustomTextFormField(
                                  hintText: "اسم المركز",
                                  controller: controller.centerNameController,
                                ),
                                CustomTextFormField(
                                  hintText: "رقم هاتف المركز",
                                  controller: controller.centerPhoneController,
                                ),
                                Text(
                                  "يرجى إدخال موقع المركز",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                TextField(
                                  controller:
                                  controller.locationDetailsController,
                                  onChanged: (String value) async {
                                    controller.isLoading.value = true;
                                    var data = await addressSuggestion(
                                        controller
                                            .locationDetailsController.text);
                                    if (data.isNotEmpty) {
                                      controller.listSource.value = data;
                                    }
                                    controller.isLoading.value = false;
                                    print("data");
                                    print(controller.listSource);

                                    controller.isLoading.value = false;
                                  },
                                ),
                               /* Obx(
                                      () => controller.isLoading.value
                                      ? Center(
                                    child: CircularProgressIndicator(color: primaryColor,),
                                  )
                                      : controller.listSource.isEmpty
                                      ? Container()
                                      : SizedBox(
                                    height:
                                    controller.listSource.isNotEmpty
                                        ? 300
                                        : 100,
                                    child: ListView.builder(
                                        itemCount: controller
                                            .listSource.length,
                                        itemBuilder:
                                            (context, index) {
                                          return ListTile(
                                            onTap: () {
                                              controller
                                                  .currentPointPosition =
                                              controller
                                                  .listSource[
                                              index]
                                                  .point!;
                                              controller
                                                  .locationDetailsController
                                                  .text =
                                                  controller
                                                      .listSource[
                                                  index]
                                                      .address
                                                      .toString();
                                              controller
                                                  .currentPointPosition =
                                              controller
                                                  .listSource[
                                              index]
                                                  .point!;
                                              print(
                                                  "currentPointPosition");
                                              print(controller
                                                  .currentPointPosition);
                                              controller.listSource
                                                  .clear();
                                              /* Fluttertoast.showToast(
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.SNACKBAR,
                          msg:
                          'Click to ${controller.listSource[index].point.toString()}');*/
                                              controller
                                                  .currentPointPosition =
                                              controller
                                                  .listSource[
                                              index]
                                                  .point!;
                                            },
                                            title: Text(
                                              controller
                                                  .listSource[index]
                                                  .address
                                                  .toString(),
                                              style: TextStyle(
                                                  color:
                                                  primaryColor),
                                            ),
                                          );
                                        }),
                                  ),
                                ),Text(
                                  "يُرجى تحديد موقعك على الخريطة",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () async {

                                      var geoPoint =
                                      await showSimplePickerLocation(
                                          context: context,
                                          isDismissible: true,
                                          title: "pick address",
                                          textConfirmPicker: "pick",
                                          initPosition: controller
                                              .currentPointPosition,
                                          /*GeoPoint(
                  latitude: currentPosition!.latitude,
                  longitude: currentPosition!.longitude),*/
                                          /* initCurrentUserPosition: UserTrackingOption(
                enableTracking: true,
              ),*/
                                          radius: 10,
                                          zoomOption: ZoomOption(
                                              stepZoom: 10, initZoom: 18));
                                      if (geoPoint != null) {
                                        controller.longitude =
                                            geoPoint.longitude;
                                        controller.latitude = geoPoint.latitude;

                                        /* Fluttertoast.showToast(
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.SNACKBAR,
                msg: 'Click to ${geoPoint.toString()}');*/
                                      }
                                    },
                                    child: Container(
                                      width: 75,
                                      height: 75,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                          BorderRadius.circular(15)),
                                      child: Icon(
                                        Icons.pin_drop,
                                        color: primaryColor,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),*/
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
                                                  2)/* &&
                                              (controller.longitude > 0 )*/) {
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
                                          /*  if(controller.longitude== 0) {
                                              message4="يُرجى تحديد الموقع على الخريطة";
                                            }*/
                                            THelperFunctions.showSnackBar(
                                                title: "رسالة خطأ",
                                                message:
                                                    "$message1 , $message2 , $message3 , $message4");
                                          }
                                        },
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