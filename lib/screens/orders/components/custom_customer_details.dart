import 'package:flutter/material.dart';
import 'package:system_admin_fuel_go/screens/orders/components/row_details.dart';

import '../../constants.dart';

class CustomCustomerDetails extends StatelessWidget {
  const CustomCustomerDetails({Key? key,required this.customerName,required this.customerPhone}) : super(key: key);
final String customerName,customerPhone;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(

        children: [
          Container(
            padding: EdgeInsets.all(defaultPadding),
            width: MediaQuery.of(context).size.width / 4,
            height: 50,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Center(
              child: Text(
                "تفاصيل الزبون",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          RowDetails(
            title: 'اسم الزبون',
            label: customerName,
          ),
          RowDetails(
            title: 'رقم الهاتف',
            label: customerPhone,
          ),
        ],
      ),
    );
  }
}
