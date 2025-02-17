import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../models/my_files.dart';
import '../../../routes/app_routes.dart';
import '../../constants.dart';
import '../../responsive.dart';

class AddButton extends StatelessWidget {
  AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: defaultPadding,
        ),
        ElevatedButton.icon(
          style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: defaultPadding * 1.5,
                vertical:
                    defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
              ),
              backgroundColor: primaryButton),
          onPressed: () {
            Get.toNamed(Routes.NEW_CENTER);
          },
          icon: Icon(
            Icons.add,
            color: primaryIcon,
          ),
          label: Text(
            'إضافة مركز جديد',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
