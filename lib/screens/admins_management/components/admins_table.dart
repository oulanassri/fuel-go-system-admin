import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:system_admin_fuel_go/models/centers.dart';

import '../../../models/city.dart';
import '../../constants.dart';
import '../../common_components/header.dart';
import '../admins_management_controller.dart';
import 'add_button1.dart';
import 'custom_admins_table.dart';

class AdminsTable extends StatelessWidget {
   AdminsTable({Key? key,}) : super(key: key);
   AdminsManagementController controller=  Get.put(AdminsManagementController());

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
                  child: Column(spacing:defaultPadding,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header(title: 'إدارة المسؤولين',),

                      AddButton1(),

                      Obx(
                            () => Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              "اختر  المركز",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall,
                            ),
                            DropdownButton<String>(
                              // updated
                                onChanged: (String? newValue) {
                                  controller.setSelectedCenter(
                                      newValue ?? '');
                                },
                                value: controller.selectedCenter.value,
                                onTap: () {}, //updated
                                items: [
                                  for (CentersModel value
                                  in controller.centersList)
                                    DropdownMenuItem(
                                      value: value.name,
                                      child: Text(
                                        value.name ?? "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge, //updated
                                      ),
                                    ),
                                ]),
                          ],
                        ),
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