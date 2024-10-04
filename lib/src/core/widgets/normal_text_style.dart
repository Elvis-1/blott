import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle normalTextStyle(
    {FontWeight fontWeight = FontWeight.normal,
    String fontFamily = 'Mulish',
    Color textColor = const Color(0xFF252525),
    double fontSize = 13}) {
  return GoogleFonts.getFont(
    fontFamily,
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: textColor,
  );
}
