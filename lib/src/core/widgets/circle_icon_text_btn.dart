import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:blott/src/config/theme/app_color.dart';
import 'package:blott/src/core/widgets/normal_text_style.dart';

Widget circleIconTextBTN(
    {String icon = 'money_swap_assets/vectors/fund_icon_x2.svg',
    String text = "",
    double circleHeight = 50,
    double circleWidth = 55,
    Color circleColor = const Color(0x6BBADBFF)}) {
  return Container(
    height: circleHeight.h,
    width: circleWidth.w,
    decoration: BoxDecoration(color: circleColor, shape: BoxShape.circle),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 35.w,
          // height: 40,
          child: SvgPicture.asset(icon
              // color: AppColors.backgroundColor,
              ),
        ),
        SizedBox(
          height: 3.h,
        ),
        Text(
          text,
          style: normalTextStyle(
              textColor: AppColors.backgroundColor, fontSize: 10.sp),
        )
      ],
    ),
  );
}
