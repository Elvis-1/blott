import 'package:flutter/material.dart';
import 'package:blott/src/config/theme/app_color.dart';
import 'package:blott/src/core/widgets/circle_with_icon.dart';
import 'package:blott/src/core/widgets/normal_text_style.dart';

AppBar appBar(BuildContext context, String text) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.black,
    elevation: 0,
    foregroundColor: AppColors.white,
    automaticallyImplyLeading: false,
    leading: GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child:
          circleWithIcon(circleColor: Colors.black, iconColor: AppColors.white),
    ),
    title: Text(
      text,
      style: normalTextStyle(fontSize: 22, fontWeight: FontWeight.w600),
    ),
    // actions: [
    //   Container(
    //     margin: EdgeInsets.only(right: 10.w),
    //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    //     color: AppColors.redColor,
    //     child: Text(
    //       "Deactivate",
    //       style: normalTextStyle(
    //           textColor: AppColors.white,
    //           fontWeight: FontWeight.w700,
    //           fontSize: 12),
    //     ),
    //   )
    // ],
  );
}
