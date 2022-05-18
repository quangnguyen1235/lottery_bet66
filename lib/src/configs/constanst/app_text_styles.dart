import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppFontSize {
  static const double fontTextTitle = 22.0;
  static const double fontTextBig = 22.0;
  static const double fontText = 16.0;
  static const double fontTextSmall = 12.0;
  static const double fontExtraSmall = 8.0;
  static const double fontTextExtraBig = 31;
  static const double fontErrorText = 14;

  static const double fontHeight  = 1.2;
}

class AppTextStyles {
  AppTextStyles._();

  static String get fontFamilyInter => 'Inter';

  static TextStyle get normal => TextStyle(
      height: AppFontSize.fontHeight,
      fontFamily: fontFamilyInter,
      color: AppColors.text,
      fontWeight: FontWeight.normal,
      fontSize: AppFontSize.fontText);

  static TextStyle get normalBold => normal.copyWith(fontWeight: FontWeight.bold);

  static TextStyle get normalBoldBlack => normal.copyWith(fontWeight: FontWeight.w900);

  static TextStyle get normalRegular => normal.copyWith(fontWeight: FontWeight.w400);

  static TextStyle get normalMedium => normal.copyWith(fontWeight: FontWeight.w500);

  static TextStyle get normalSemiBold => normal.copyWith(fontWeight: FontWeight.w600);

  static TextStyle get small => normal.copyWith(fontSize: AppFontSize.fontTextSmall);

  static TextStyle get smallBold => small.copyWith(fontWeight: FontWeight.bold);

  static TextStyle get smallBoldBlack => small.copyWith(fontWeight: FontWeight.w900);
}
