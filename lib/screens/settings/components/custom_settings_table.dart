import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../models/service.dart';
import '../../../routes/app_routes.dart';
import '../../common_components/custom_material_button.dart';
import '../../common_components/header.dart';
import '../../constants.dart';
import '../settings_controller.dart';

class CustomSettingsTable extends StatelessWidget {
  CustomSettingsTable({
    super.key,
    required this.controller
  });
  SettingsController controller;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
          /*  SizedBox(
              height: defaultPadding,
            ), Text(controller.time.toString() ?? ""),*/
            SizedBox(
              height: defaultPadding,
            ),
           /* AddButton(),
            SizedBox(
              height: defaultPadding,
            ),
            */
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
                        title: ' الإعدادات',
                      ),

                      SizedBox(
                        height: defaultPadding,
                      ),
                      // AddButton(),
                      Container(
                        padding: EdgeInsets.all(defaultPadding),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: DataTable(
                                columnSpacing: defaultPadding,
                                columns: [
                                  DataColumn(
                                    label: Text(
                                      "رقم الخدمة",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "الخدمة",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "السعر",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),

                                ],
                                rows: List.generate(
                                  servicesList.length,
                                  (index) =>
                                      serviceDataRow(servicesList[index], context),
                                ),
                              ),
                            ),
                          ],
                        ),
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

  DataRow serviceDataRow(ServiceModel serviceModel, BuildContext context) {
    return DataRow(
      onLongPress: (){
        Get.toNamed(Routes.EDIT_SERVICE_SCREEN);
      },
      cells: [
        DataCell(
          Text(
            serviceModel.id ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        DataCell(
          Text(
            serviceModel.name ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        DataCell(
          Text(
            serviceModel.price ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),

      ],
    );
  }
}
