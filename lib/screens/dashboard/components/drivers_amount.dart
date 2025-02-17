import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/theme/custom_themes/text_theme.dart';
import '../../constants.dart';
class DriversAmount extends StatelessWidget {
  const DriversAmount({
    super.key,
    required this.title,
    required this.svgSrc,
    required this.numOfDrivers,
  });

  final String title, svgSrc;
  final int numOfDrivers;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration:BoxDecoration(border: Border.all(
        width: 1.0,
        // assign the color to the border color
        color: primaryColor,
      ),
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(svgSrc),
          ),
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
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme.titleLarge,

                  ),
                  Text(
                    "$numOfDrivers سائق ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium

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