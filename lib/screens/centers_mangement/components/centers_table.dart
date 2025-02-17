import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../common_components/header.dart';
import 'custom_centers_table.dart';
import '../../dashboard/components/orders_details.dart';
import '../../responsive.dart';
import 'add_button.dart';

class CentersTable extends StatelessWidget {
  const CentersTable({Key? key}) : super(key: key);

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
                      Header(title: 'إدارة المراكز',),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      AddButton(),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      CustomCentersTable(),


                    ],
                  ),
                ),

                Expanded(flex:1,child: SizedBox())
              ],
            ),
          ],
        ),
      ),
    );
  }
}