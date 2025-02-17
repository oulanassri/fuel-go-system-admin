import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
class OrdersAmount extends StatelessWidget {
  const OrdersAmount({
    super.key,
    required this.title,
    required this.svgSrc,
    required this.numOfOrders,
  });

  final String title, svgSrc;
  final int numOfOrders;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(

        border: Border.all(
          width: 2,
          color: primaryColor.withOpacity(0.15),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [
         /* SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(svgSrc),
          ),*/
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,style: Theme.of(context)
                      .textTheme.titleLarge,
                  ),
                  Text(
                    "$numOfOrders طلب ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                      ,
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}