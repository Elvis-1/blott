import 'package:flutter/material.dart';
import 'package:blott/src/config/theme/app_color.dart';
import 'package:blott/src/core/widgets/normal_text_style.dart';

Widget textAndIcon() {
  return Row(
    children: [
      Text(
        "Skip",
        style: normalTextStyle(textColor: AppColors.lightBlueColor),
      ),
      const Icon(Icons.chevron_right)
    ],
  );
}
