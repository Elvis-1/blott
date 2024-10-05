import 'package:blott/src/core/utils/functions/convert_date.dart';
import 'package:blott/src/features/news/domain/dtos/response/news_list_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blott/src/config/theme/app_color.dart';
import 'package:blott/src/core/widgets/app_bar.dart';
import 'package:blott/src/core/widgets/normal_text_style.dart';
import 'package:intl/intl.dart';

class NewsDetails extends StatelessWidget {
  NewsDetails({super.key, required this.news});

  NewsArticle news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(context, ''),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Container(width: 50, child: Image.network(news.image!)),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${news.category}",
                        style: normalTextStyle(
                            fontFamily: "Roboto",
                            textColor: AppColors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        DateFormat('d MMMM, yyyy')
                            .format(
                                convertDate(news.datetime) ?? DateTime.now())
                            .toUpperCase(),
                        style: normalTextStyle(textColor: AppColors.grayColor),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                news.summary!,
                textAlign: TextAlign.left,
                style: normalTextStyle(
                  textColor: AppColors.grayColor,
                  fontFamily: "Roboto",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
