import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blott/src/config/theme/app_color.dart';
import 'package:blott/src/core/widgets/normal_text_style.dart';

Widget ticketContainer(
    {String ticketId = '',
    String ticketDetails = '',
    String status = '',
    String date = ''}) {
  return Container(
    margin: EdgeInsets.only(top: 20.h),
    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
    decoration: BoxDecoration(color: AppColors.white, boxShadow: [
      BoxShadow(offset: Offset(2, 2), color: Colors.grey.shade200)
    ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 150,
              child: Text(
                ticketId,
                overflow: TextOverflow.ellipsis,
                style:
                    normalTextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              width: 150,
              child: Text(
                ticketDetails,
                overflow: TextOverflow.ellipsis,
                style:
                    normalTextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              color: status == "Pending"
                  ? AppColors.lightPink
                  : AppColors.lightGreen,
              padding: EdgeInsets.all(5),
              child: Text(
                status,
                style: normalTextStyle(
                    textColor: status == "Pending"
                        ? AppColors.redColor
                        : AppColors.darkGreenColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              date,
              style: normalTextStyle(
                  fontFamily: "League Spartan",
                  fontSize: 12,
                  fontWeight: FontWeight.w200),
            ),
          ],
        )
      ],
    ),
  );
}
