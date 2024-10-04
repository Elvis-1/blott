import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blott/src/config/theme/app_color.dart';
import 'package:blott/src/core/widgets/normal_text_style.dart';

Widget newsContainer(
    String thumbnial, String category, String date, String details) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(bottom: 25.h),
    child: Row(
      children: [
        Container(
            height: 100,
            width: 100,
            child: Image.network(
              thumbnial,
              fit: BoxFit.cover,
            )),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    category,
                    style: normalTextStyle(
                        fontFamily: "Roboto", textColor: AppColors.grayColor),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Text(date,
                      style: normalTextStyle(
                        fontFamily: "Roboto",
                        textColor: AppColors.grayColor,
                      )),
                ],
              ),
              SizedBox(
                width: 260.w,
                child: Text(
                  details,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: normalTextStyle(
                      fontFamily: "Roboto",
                      textColor: AppColors.white,
                      fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
