import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../models/admin.dart';
import '../../../models/center_model.dart';
import '../../../models/recent_file.dart';
import '../../constants.dart';
import '../admins_management_controller.dart';

class CustomAdminsTable extends StatelessWidget {
   CustomAdminsTable({
    super.key,
  });
   final AdminsManagementController controller =
   Get.put(AdminsManagementController());
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
        child: CircularProgressIndicator(color: primaryColor,),
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
                    "رقم المسؤول",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                DataColumn(
                  label: Text(
                    "الاسم",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),

                DataColumn(
                  label: Text("الهاتف",
                    style: Theme.of(context).textTheme.titleLarge,),
                ),
                DataColumn(
                  label: Text("الحالة",
                    style: Theme.of(context).textTheme.titleLarge,),
                ),
              ],
              rows: List.generate(
                controller.admins.length,
                (index) => adminDataRow(controller.admins[index],context),
              ),
            ),
          ),
        ],
      )),
    );
  }

  DataRow adminDataRow(AdminModel adminModel,BuildContext context) {
    return DataRow(
      cells: [
        DataCell(
          Text(adminModel.id.toString() ?? "",
            style:Theme.of(context).textTheme.bodyLarge,),
        ),
        DataCell(
          Text(adminModel.name ?? "",
            style: Theme.of(context).textTheme.bodyLarge,),
        ),
        DataCell(
          Text(adminModel.phone ?? "",
            style: Theme.of(context).textTheme.bodyLarge,),
        ),
        DataCell(
          Text(adminModel.statusName ?? "",
            style:Theme.of(context).textTheme.bodyLarge,),
        ),

      ],
    );
  }
}
