import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../models/center_model.dart';
import '../../../models/centers.dart';
import '../../../models/recent_file.dart';
import '../../constants.dart';
import '../centers_managment_controller.dart';

class CustomCentersTable extends StatelessWidget {
  CustomCentersTable({
    super.key,
  });

  final CentersManagementController controller =
      Get.put(CentersManagementController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Obx(() => controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
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
                          "رقم المركز",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "اسم المركز",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "الحيّ",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),DataColumn(
                        label: Text(
                          "الهاتف",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
                    rows: List.generate(
                      controller.centersList.length,
                      (index) =>
                          centerDataRow(controller.centersList[index], context),
                    ),
                  ),
                ),
              ],
            )),
    );
  }

  DataRow centerDataRow(CentersModel centerModel, BuildContext context) {
    return DataRow(
      cells: [
        DataCell(
          Text(
            centerModel.id.toString() ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        DataCell(
          Text(
            centerModel.name ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        DataCell(
          Text(
            centerModel.neighborhoodName ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        DataCell(
          Text(
            centerModel.phone ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
