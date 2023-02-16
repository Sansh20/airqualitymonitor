import 'package:flutter/material.dart';
import 'package:airqualitymonitor/theme/gruv_colors.dart';

class MainTheme {
  static ThemeData get theme {
    return ThemeData(
      backgroundColor: GruvColors.black,
      primaryColor: GruvColors.white,
      fontFamily: "Satoshi",
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 28,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w900,
          color: GruvColors.black,
        ),
        headline2: TextStyle(
          fontSize: 42,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w900,
          color: GruvColors.black,
        ),
        headline3: TextStyle(
          fontSize: 16,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w700,
          color: GruvColors.black,
        ),
        headline4: TextStyle(
          fontSize: 15,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.bold,
          color: GruvColors.black,
        ),
        headline5: TextStyle(
          fontSize: 15,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w700,
          color: GruvColors.black,
          overflow: TextOverflow.visible,
        ),
        headline6: TextStyle(
          fontSize: 22,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w800,
          color: GruvColors.black,
          overflow: TextOverflow.visible,
        ),
        labelMedium: TextStyle(
          fontSize: 19,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w700,
          color: GruvColors.black,
        ),
      ),
    );
  }
}
