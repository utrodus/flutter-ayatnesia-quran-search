import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color primary = Color(0xff22B1C3);
  static const Color secondary = Color(0xff1D352E);
  static const Color disabled = Color.fromARGB(255, 138, 141, 153);
  static const Color onPrimary = Colors.white;
  static const Color onSecondary = Colors.black;
  static const Color background = Colors.white;
  static const Color onSurface = Colors.white;
  static const Color backgroundVariant = Color(0xffF7FAFD);
  static const Color grey = Color(0xff5F5F5F);
  static const Color darkGreen = Color.fromARGB(255, 14, 101, 112);
  static const Color lightGreen = Color(0xffA6E9D4);
  static const Color lightRed = Color(0xffF54749);
  static const Color successColor = Color(0xff5CC8A6);
  static const Color errorColor = Color(0xffF54749);
  static Color shadowColor = const Color(0xffE6EDF3).withOpacity(0.7);
  static Color lightShadowColor = const Color(0xffCDCDCD);
  static Color skeletonBaseColor = const Color(0xFFF5F5F5);
  static Color skeletonHightlightColor = const Color(0xFFE0E0E0);
  static List<Color> primaryGradient = <Color>[
    const Color(0xff22B1C3),
    const Color(0xff31B4AC),
  ];
}
