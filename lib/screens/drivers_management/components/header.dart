import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../responsive.dart';
class Header extends StatelessWidget {
  const Header({Key? key, required this.title}) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        ElevatedButton.icon(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: defaultPadding * 1.5,
              vertical: defaultPadding /
                  (Responsive.isMobile(context) ? 2 : 1),),
          ),
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('Add New'),
        ),
      ],
    );
  }
}
