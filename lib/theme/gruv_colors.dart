// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum AQIColorEnum { GOOD, MOD, UHS, UHLTHY, VUHLTHY, HAZ }

List<String> classes = [
  "Good",
  "Moderate",
  "Unhealthy For Sensitive Groups",
  "Unhealthy",
  "Very Unhealthy",
  "Hazardous"
];

class GruvColors {
  static const black = Color(0xFF282828);
  static const white = Color(0xFFFFFBE9);
  static const brown = Color(0xFF504945);
  static const offWhite = Color(0xFFEBDBB2);

  static const good = Color(0xFF8EC07C);
  static const moderate = Color(0xFFFABD2F);
  static const uhs = Color(0xFFFE8019);
  static const unhealthy = Color(0xFFD08770);
  static const vUnhealthy = Color(0xFFBF616A);
  static const hazard = Color(0xFFFB4934);

  static const Map<AQIColorEnum, Color> colorMap = {
    AQIColorEnum.GOOD: good,
    AQIColorEnum.MOD: moderate,
    AQIColorEnum.UHS: uhs,
    AQIColorEnum.UHLTHY: unhealthy,
    AQIColorEnum.VUHLTHY: vUnhealthy,
    AQIColorEnum.HAZ: hazard
  };
}
