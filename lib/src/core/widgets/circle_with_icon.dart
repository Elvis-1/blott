import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget circleWithIcon(
    {String appIcon = 'blott/images/back.png',
    Color circleColor = const Color(0xFF007AFF),
    double cirlecleWidth = 50,
    double cirlecleHeight = 50,
    double iconWidth = 6.1,
    double iconHeight = 12,
    Color iconColor = Colors.white}) {
  return Container(
    height: cirlecleHeight,
    width: cirlecleWidth,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cirlecleHeight / 2),
        color: circleColor),
    child: Container(
      width: cirlecleWidth,
      height: cirlecleHeight,
      //padding: EdgeInsets.fromLTRB(0, 18.2, 0, 20.2),
      child: SizedBox(
        width: iconWidth.w,
        height: iconHeight.h,
        child: Image.asset(
          appIcon,
          color: iconColor,
        ),
      ),
    ),
  );
}

Widget circleWithDefaultIconColor({
  String appIcon = 'money_swap_assets/images/back.png',
  Color circleColor = const Color(0xFF007AFF),
  double cirlecleWidth = 50,
  double cirlecleHeight = 50,
  double iconWidth = 6.1,
  double iconHeight = 12,
}) {
  return Container(
    height: cirlecleHeight,
    width: cirlecleWidth,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cirlecleHeight / 2),
        color: circleColor),
    child: Container(
      width: cirlecleWidth,
      height: cirlecleHeight,
      //padding: EdgeInsets.fromLTRB(0, 18.2, 0, 20.2),
      child: SizedBox(
        width: iconWidth.w,
        height: iconHeight.h,
        child: Image.asset(
          appIcon,
        ),
      ),
    ),
  );
}
