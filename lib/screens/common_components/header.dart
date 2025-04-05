import 'package:flutter/material.dart';

import '../constants.dart';
import '../responsive.dart';
import '../dashboard/dashboard_screen.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        if (!Responsive.isMobile(context))
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
      ],
    );
  }
}
