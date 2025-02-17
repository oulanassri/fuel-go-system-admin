import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/center_model.dart';
import '../../../models/driver_model.dart';
import '../../../models/recent_file.dart';
import '../../constants.dart';

class CustomDriversTable extends StatelessWidget {
  const CustomDriversTable({
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
                    "رقم السّائق",
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
                  label: Text("رقم الشّاحنة",
                    style: Theme.of(context).textTheme.titleLarge,),
                ),
              ],
              rows: List.generate(
                driversList.length,
                (index) => driverDataRow(driversList[index],context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow driverDataRow(DriverModel driverModel,BuildContext context) {
    return DataRow(
      cells: [
        DataCell(
          Text(driverModel.id ?? "",
            style:Theme.of(context).textTheme.bodyLarge,),
        ),
        DataCell(
          Text(driverModel.name ?? "",
            style: Theme.of(context).textTheme.bodyLarge,),
        ),
        DataCell(
          Text(driverModel.email ?? "",
            style: Theme.of(context).textTheme.bodyLarge,),
        ),
        DataCell(
          Text(driverModel.phone ?? "",
            style:Theme.of(context).textTheme.bodyLarge,),
        ),
        DataCell(
          Text(driverModel.lorryNumber ?? "",
            style: Theme.of(context).textTheme.bodyLarge,),
        ),
      ],
    );
  }
}
