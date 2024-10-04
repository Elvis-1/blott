import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blott/src/config/theme/app_color.dart';
import 'package:blott/src/core/utils/app_const/app_icons.dart';
import 'package:blott/src/core/widgets/app_bar.dart';
import 'package:blott/src/core/widgets/normal_text_style.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key});

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
                  Container(width: 50, child: Image.asset(AppIcons.imageIcon)),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Category",
                        style: normalTextStyle(
                            fontFamily: "Roboto",
                            textColor: AppColors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Date",
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
                "For years, I lived with the pain and limitations of having the sickle cell genotype. Countless hospital visits and painful crises became a part of my life. My faith in God was strong, but the struggle was relentless. Despite the adversity, I held on to the hope that one day, I would experience healing.One evening, during a powerful prayer session at my church, I felt an overwhelming sense of peace and warmth envelop me. The pastor, led by the Spirit, specifically prayed for those suffering from chronic illnesses. As the congregation joined in fervent prayer, I felt a shift within me. It was as if a heavy burden was being lifted off my shoulders,In the weeks that followed, I noticed a remarkable change. The frequent crises that had plagued my life began to subside. My energy levels increased, and I felt a renewed sense of vitality. Encouraged by these changes, I decided to visit my doctor for a comprehensive check-up. The results were nothing short of a miracle. My genotype had changed from SS to AA. The doctors were baffled, unable to explain the transformation scientifically. But I knew the truth—it was Jesus who had healed me.Today, I live free from the pain and limitations that once defined my life. My story is a testament to the incredible power of faith and prayer. Jesus changed my genotype, and with it, He transformed my entire life. I now use my testimony to encourage others, reminding them that with God, all things are possible.",
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
