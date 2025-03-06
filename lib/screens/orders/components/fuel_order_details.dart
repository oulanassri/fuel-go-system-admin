import 'package:flutter/material.dart';
import 'package:system_admin_fuel_go/screens/orders/components/row_details.dart';

import '../../constants.dart';
class FuelOrderDetails extends StatelessWidget {
  const FuelOrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: 300,
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
            width: MediaQuery.of(context).size.width / 3,
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
                "تفاصيل الطلب",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          RowDetails(
            title: 'تاريخ الطلب',
            label: '20/10/2024  12:12 PM',
          ),
          RowDetails(
            title: 'الموقع',
            label: 'الحيّ + المدينة + تفاصيل عن الموقع',
          ),
          RowDetails(
            title: 'نوع الوقود',
            label: 'بيزين',
          ),
          RowDetails(
            title: 'كمية التعبئة',
            label: '20',
          ),
          RowDetails(
            title: 'الكلفة الإجمالية',
            label: '20',
          ),
        ],
      ),
    );
  }
}
