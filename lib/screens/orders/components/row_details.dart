import 'package:flutter/material.dart';

import '../../constants.dart';

class RowDetails extends StatelessWidget {
  const RowDetails({Key? key, required this.title, required this.label})
      : super(key: key);
  final String title, label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding / 2),
      child: Row(
        children: [
          Text("$title :", style: Theme.of(context).textTheme.titleLarge),
          Text(
            "$label ",
            style: Theme.of(context).textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}
