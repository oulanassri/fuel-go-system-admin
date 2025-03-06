import 'package:flutter/material.dart';

import '../common_components/header.dart';
import '../common_components/side_menu.dart';
import '../constants.dart';
import '../responsive.dart';
import 'components/custom_customer_details.dart';
import 'components/custom_driver_details.dart';
import 'components/fuel_order_details.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child:SafeArea(
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
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomCustomerDetails(),
                                      CustomDriverDetails(),
                                    ],
                                  ),
                                  FuelOrderDetails(),
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
                ),//CustomOrdersTable()// OrderDetails(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
