import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/admin_model.dart';
import '../../../models/center_model.dart';
import '../../../models/recent_file.dart';
import '../../constants.dart';

class CustomAdminsTable extends StatelessWidget {
   CustomAdminsTable({
    super.key,
  });

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
                  label: Text("البريد الإلكتروني",
                    style: Theme.of(context).textTheme.titleLarge,),
                ),
                DataColumn(
                  label: Text("الهاتف",
                    style: Theme.of(context).textTheme.titleLarge,),
                ),
                DataColumn(
                  label: Text("المركز",
                    style: Theme.of(context).textTheme.titleLarge,),
                ),
              ],
              rows: List.generate(
                adminsList.length,
                (index) => adminDataRow(adminsList[index],context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow adminDataRow(AdminModel adminModel,BuildContext context) {
    return DataRow(
      cells: [
        DataCell(
          Text(adminModel.id ?? "",
            style:Theme.of(context).textTheme.bodyLarge,),
        ),
        DataCell(
          Text(adminModel.name ?? "",
            style: Theme.of(context).textTheme.bodyLarge,),
        ),
        DataCell(
          Text(adminModel.email ?? "",
            style: Theme.of(context).textTheme.bodyLarge,),
        ),
        DataCell(
          Text(adminModel.phone ?? "",
            style:Theme.of(context).textTheme.bodyLarge,),
        ),
        DataCell(
          Text(adminModel.center ?? "",
            style: Theme.of(context).textTheme.bodyLarge,),
        ),
      ],
    );
  }
}
