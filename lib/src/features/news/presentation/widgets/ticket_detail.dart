import 'package:flutter/material.dart';
import 'package:blott/src/core/widgets/normal_text_style.dart';

Widget ticketDetail(
    {Color mainTextColor = const Color(0xFF252525),
    Color subTextColor = const Color(0xFF252525),
    FontWeight fontWeight = FontWeight.w700,
    String mainText = '',
    String subText = ''}) {
  return Row(
    children: [
      Text(
        mainText,
        style: normalTextStyle(
            fontWeight: fontWeight, fontSize: 16, textColor: mainTextColor),
      ),
      SizedBox(
        width: 10,
      ),
      Text(
        subText,
        style: normalTextStyle(
            fontWeight: FontWeight.w700, fontSize: 16, textColor: subTextColor),
      ),
    ],
  );
}
