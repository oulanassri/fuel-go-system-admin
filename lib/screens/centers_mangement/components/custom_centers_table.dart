import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/center_model.dart';
import '../../../models/recent_file.dart';
import '../../constants.dart';

class CustomCentersTable extends StatelessWidget {
  const CustomCentersTable({
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
                    "رقم المركز",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                DataColumn(
                  label: Text(
                    "الموقع",
                    style:  Theme.of(context).textTheme.titleLarge,
                  ),
                ),

              ],
              rows: List.generate(
                centersList.length,
                (index) => centerDataRow(centersList[index],context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow centerDataRow(CenterModel centerModel,BuildContext context) {
    return DataRow(
      cells: [
        DataCell(
          Text(centerModel.id ?? "",
            style: Theme.of(context).textTheme.bodyLarge,),
        ),
        DataCell(
          Text(centerModel.location ?? "",
            style: Theme.of(context).textTheme.bodyLarge,),
        ),

      ],
    );
  }
}
