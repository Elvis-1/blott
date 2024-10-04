import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blott/src/core/widgets/normal_text_style.dart';

Widget textBtnWithoutGradient(
  String text,
  double horizontalPadding,
  double verticalPadding,
  Color containerColor, {
  FontWeight fontWeight = FontWeight.w600,
  double fontSize = 18,
  Color textColor = Colors.black,
  double borderRadius = 5,
}) {
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding.w, vertical: verticalPadding.h),
    decoration: BoxDecoration(
        color: containerColor,
        // Color(0xFFC4C4C4),
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius.w),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade100,
              offset: const Offset(
                1,
                4,
              ),
              spreadRadius: 1),
          const BoxShadow(
              color: Colors.black26,
              offset: Offset(
                -1,
                4,
              ))
        ]),
    child: Text(
      text,
      style: normalTextStyle(
          fontSize: fontSize.sp, fontWeight: fontWeight, textColor: textColor),
    ),
  );
}

Widget textBtnWithoutGradientAndShadow(String text, double horizontalPadding,
    double verticalPadding, Color containerColor,
    {FontWeight fontWeight = FontWeight.w600,
    double fontSize = 18,
    Color textColor = Colors.black,
    double borderRadius = 5}) {
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding.w, vertical: verticalPadding.h),
    decoration: BoxDecoration(
      color: containerColor,
      // Color(0xFFC4C4C4),
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius.w),
      ),
    ),
    child: Text(
      text,
      style: normalTextStyle(
          fontSize: fontSize.sp, fontWeight: fontWeight, textColor: textColor),
    ),
  );
}
