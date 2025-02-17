import 'package:flutter/material.dart';
import 'package:system_admin_fuel_go/screens/dashboard/components/orders_amount.dart';

import '../../constants.dart';
class OrdersDetails extends StatelessWidget {
  const OrdersDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(border: Border.all(
        width: 1.0,
        // assign the color to the border color
        color: primaryColor,
      ),
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            'تفاصيل الطّلبات',
            style:Theme.of(context)
                .textTheme.titleLarge,
          ),
          SizedBox(
            height: defaultPadding,
          ),

          OrdersAmount(
            title: 'طلبات جاري تنفيذها',
            svgSrc: "assets/icons/Documents.svg",

            numOfOrders: 1328,
          ),
          OrdersAmount(
            title: 'طلبات قيد الانتظار',
            svgSrc: "assets/icons/media.svg",

            numOfOrders: 1328,
          ),
          OrdersAmount(
            title: 'طلبات مكتملة',
            svgSrc: "assets/icons/folder.svg",

            numOfOrders: 1328,
          ),
          OrdersAmount(
            title: 'طلبات ملغاة',
            svgSrc: "assets/icons/unKnown.svg",

            numOfOrders: 140,
          ),
        ],
      ),
    );
  }
}