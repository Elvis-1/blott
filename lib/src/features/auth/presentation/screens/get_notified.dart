import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blott/src/config/theme/app_color.dart';
import 'package:blott/src/core/utils/app_const/app_icons.dart';
import 'package:blott/src/core/widgets/normal_text_style.dart';
import 'package:blott/src/core/widgets/text_btn_without_gradient.dart';
import 'package:blott/src/features/news/presentation/screens/news.dart';

class GetNotified extends StatelessWidget {
  const GetNotified({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Column(
              children: [
                Image.asset(AppIcons.notifyIcon),
                SizedBox(
                  height: 15.h,
                ),
                Image.asset(AppIcons.getIcon),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Allow notifications to stay in the loop with your payments, requests and groups",
                  textAlign: TextAlign.center,
                  style: normalTextStyle(
                      fontFamily: "Roboto",
                      fontSize: 17,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const News()));
              },
              child: textBtnWithoutGradientAndShadow(
                  "Continue", 150, 10, AppColors.lightPrimaryColor,
                  textColor: AppColors.white, borderRadius: 25),
            ),
          ],
        ),
      ),
    );
  }
}
