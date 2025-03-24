import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../common_components/header.dart';
import '../common_components/side_menu.dart';
import '../constants.dart';
import '../responsive.dart';
import 'components/custom_customer_details.dart';
import 'components/custom_driver_details.dart';
import 'components/fuel_order_details.dart';

class OrderDetails extends StatelessWidget {
  OrderDetails({Key? key}) : super(key: key);
  String date = Get.parameters['date'].toString();
  String orderNumber = Get.parameters['orderNumber'].toString();
  String locationDescription = Get.parameters['locationDescription'].toString();

  String neighborhoodName = Get.parameters['neighborhoodName'].toString();
  String fuelTypeName = Get.parameters['fuelTypeName'].toString();
  String orderedQuantity = Get.parameters['orderedQuantity'].toString();
  String price = Get.parameters['price'].toString();
  String finalQuantity = Get.parameters['finalQuantity'].toString();
  String finalPrice = Get.parameters['finalPrice'].toString();
  String customerCarBrand = Get.parameters['customerCarBrand'].toString();
  String customerApartmentName =
      Get.parameters['customerApartmentName'].toString();
  String authCode = Get.parameters['authCode'].toString();

  @override
  Widget build(BuildContext context) {
    print(date);
    return Container(
      decoration: BoxDecoration(gradient: gradientColorBg),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: SideMenu(),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  child: SideMenu(),
                ),
              Expanded(
                flex: 5,
                child: SafeArea(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: defaultPadding,
                                children: [
                                  Header(
                                    title: 'تفاصيل الطلب',
                                  ),

                                  SizedBox(
                                    height: defaultPadding,
                                  ),
                                  // AddButton(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomCustomerDetails(
                                        customerName: customerApartmentName,
                                        customerPhone: '',
                                      ),
                                      CustomDriverDetails(
                                        driverName: '',
                                        driverPhone: '',
                                        driverLorryPlateNumber: '',
                                      ),
                                    ],
                                  ),
                                  FuelOrderDetails(
                                    date: date,
                                    neighborhoodName: neighborhoodName,
                                    locationDescription: locationDescription,
                                    fuelTypeName: fuelTypeName,
                                    finalQuantity: finalQuantity,
                                    finalPrice: finalPrice,
                                  ),
                                  // CustomLorriesTable(),
                                ],
                              ),
                            ),
                            Expanded(flex: 1, child: SizedBox())
                          ],
                        ),
                      ],
                    ),
                  ),
                ), //CustomOrdersTable()// OrderDetails(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
