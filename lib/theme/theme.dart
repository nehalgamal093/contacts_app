import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = const Color(0xff29384D);
  static Color secondaryColor = const Color(0xffFFF1D4);
  static Color whiteClr = Colors.white;
  static Color redClr = const Color(0xffF93E3E);
  static ThemeData themeData = ThemeData(
    textTheme: TextTheme(
      displaySmall: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: primaryColor,
          fontSize: 10,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter'),
      displayMedium: const TextStyle(
        overflow: TextOverflow.ellipsis,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          fontFamily: 'Inter',
          color: Color(0xff29384D),),
      bodyMedium:const TextStyle(
          overflow: TextOverflow.ellipsis,
          color: Color(0xffFFF1D4),
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter')
    ),
  );
}
