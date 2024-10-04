import 'package:flutter/material.dart';
import 'package:blott/src/config/theme/app_color.dart';
import 'package:blott/src/core/widgets/normal_text_style.dart';

Widget customTextField(String hint, TextEditingController controller) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(width: 1, color: AppColors.lightGrayColor2))),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          hintStyle: normalTextStyle(
              fontFamily: "Roboto", fontWeight: FontWeight.w200, fontSize: 20)),
    ),
  );
}
