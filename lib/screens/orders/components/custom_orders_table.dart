import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../models/orders.dart';
import '../../../models/recent_file.dart';
import '../../../routes/app_pages.dart';
import '../../../routes/app_routes.dart';
import '../../common_components/header.dart';
import '../../constants.dart';
import '../orders_controller.dart';

class CustomOrdersTable extends StatelessWidget {
  CustomOrdersTable({
    super.key,
    required this.title,
    required this.controller,
  });

  final String title;
  OrdersController controller;

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: defaultPadding,
                    children: [
                      Header(
                        title: title,
                      ),

                      SizedBox(
                        height: defaultPadding,
                      ),
                      // AddButton(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(
                            () => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "اختر  حالة الطّلب",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                DropdownButton<String>(
                                    // updated
                                    onChanged: (String? newValue) {
                                      controller.setSelectedOrderStatusCenter(
                                          newValue ?? '');
                                    },
                                    value: controller.selectedOrderStatus.value,
                                    onTap: () {}, //updated
                                    items: [
                                      for (String value
                                          in controller.orderStatusList)
                                        DropdownMenuItem(
                                          value: value,
                                          child: Text(
                                            value ?? "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge, //updated
                                          ),
                                        ),
                                    ]),
                              ],
                            ),
                          ),
                          Text("لمعرفة تفاصيل أكثر اضغط مطوّلا على الطّلب",
                              style: TextStyle().copyWith(
                                fontSize: 18,
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.w500,
                                color: Colors.red,
                              ))
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(defaultPadding),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Obx(() => controller.isLoading.value
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: primaryColor,
                                ),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: DataTable(
                                      columnSpacing: defaultPadding,
                                      columns: [
                                        DataColumn(
                                          label: Text(
                                            " رقم االطلب",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            " المركز",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            "نوع الوقود",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            "التاريخ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          ),
                                        ),
                                      ],
                                      rows: List.generate(
                                        controller.orders.length,
                                        (index) => orderDataRow(
                                            controller.orders[index], context),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                      )
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
    );
  }

  DataRow orderDataRow(OrdersModel orderModel, BuildContext context) {
    return DataRow(
      onLongPress: () {
        Get.toNamed(Routes.ORDER_DETAILS, parameters: {
          "date": orderModel.date ?? "",
          "orderNumber": orderModel.orderNumber ?? "",
          "locationDescription": orderModel.locationDescription ?? "",
          "neighborhoodName": orderModel.neighborhoodName ?? "",
          "fuelTypeName": orderModel.fuelTypeName ?? "",
          "orderedQuantity": orderModel.orderedQuantity.toString() ?? "",
          "price": orderModel.price ?? "",
          "finalQuantity": orderModel.finalQuantity ?? "",
          "finalPrice": orderModel.finalPrice ?? "",
          "customerCarBrand": orderModel.customerCarBrand ?? "",
          "customerApartmentName": orderModel.customerApartmentName ?? "",
          "authCode": orderModel.authCode ?? "",
          "customerName": orderModel.customerName ?? "",
          "customerPhone": orderModel.customerPhone ?? "",
          "driverName": orderModel.driverName ?? "",
          "driverPhone": orderModel.driverPhone ?? "",
          "centerName": orderModel.centerName ?? "",
        });
      },
      cells: [
        DataCell(
          Text(
            orderModel.orderNumber ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        DataCell(
          Text(
            orderModel.centerName ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        DataCell(
          Text(
            orderModel.fuelTypeName ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        DataCell(
          Text(
            orderModel.date ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
