import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/auth/config/custom_colors.dart';

class AppWidgetName extends StatelessWidget {

  final Color? greenTitleColor;
  final double textSize;

  const AppWidgetName({
    Key? key,
    this.textSize = 30,
    this.greenTitleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(fontSize: textSize),
        children: [
          TextSpan(
            text: 'Green',
            style: TextStyle(color: greenTitleColor ?? CustomColors.customSwatchColor),
          ),
          TextSpan(
            text: 'grocer',
            style: TextStyle(color: CustomColors.customContrastColor),
          ),
        ],
      ),
    );
  }
}
