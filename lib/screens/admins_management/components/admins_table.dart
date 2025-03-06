import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../common_components/header.dart';
import 'add_button1.dart';
import 'custom_admins_table.dart';

class AdminsTable extends StatelessWidget {
  const AdminsTable({Key? key}) : super(key: key);

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
                      Header(title: 'إدارة المسؤولين',),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      AddButton1(),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      CustomAdminsTable(),


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