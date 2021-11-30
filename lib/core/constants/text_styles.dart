// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  AppTextStyles._();
  static const String appFontFamily = "Poppins";
  static TextStyle PoppinsBody1(
      {required Color textColor, bool isRegular = true}) {
    return TextStyle(
      fontFamily: appFontFamily,
      fontSize: 18.sp,
      fontWeight: isRegular ? FontWeight.w400 : FontWeight.w700,
      color: textColor,
      height: 1.556,
    );
  }

  static TextStyle PoppinsBody2(
      {required Color textColor, bool isRegular = true}) {
    return TextStyle(
      fontFamily: appFontFamily,
      fontSize: 16.sp,
      fontWeight: isRegular ? FontWeight.w400 : FontWeight.w700,
      color: textColor,
      height: 1.5,
    );
  }

  static TextStyle PoppinsSubtitle(
      {required Color textColor, bool isMedium = true}) {
    return TextStyle(
      fontFamily: appFontFamily,
      fontSize: 14.sp,
      fontWeight: isMedium ? FontWeight.w500 : FontWeight.w700,
      color: textColor,
      height: 1.571,
    );
  }

  static TextStyle PoppinsFootnote(
      {required Color textColor, bool isMedium = true}) {
    return TextStyle(
      fontFamily: appFontFamily,
      fontSize: 13.sp,
      fontWeight: isMedium ? FontWeight.w500 : FontWeight.w700,
      color: textColor,
      height: 1.384,
    );
  }

  static TextStyle PoppinsCaption(
      {required Color textColor, bool isMedium = true}) {
    return TextStyle(
      fontFamily: appFontFamily,
      fontSize: 12.sp,
      fontWeight: isMedium ? FontWeight.w500 : FontWeight.w700,
      color: textColor,
      height: 1.333,
    );
  }

  static TextStyle PoppinsH4(
      {required Color textColor, bool isSemiBold = true}) {
    return TextStyle(
      fontFamily: appFontFamily,
      fontSize: 16.sp,
      fontWeight: isSemiBold ? FontWeight.w600 : FontWeight.w700,
      color: textColor,
      height: 1.625,
    );
  }

  static TextStyle PoppinsH3(
      {required Color textColor, bool isSemiBold = true}) {
    return TextStyle(
      fontFamily: appFontFamily,
      fontSize: 18.sp,
      fontWeight: isSemiBold ? FontWeight.w600 : FontWeight.w700,
      color: textColor,
      height: 1.45,
    );
  }

  static TextStyle PoppinsH2(
      {required Color textColor, bool isSemiBold = true}) {
    return TextStyle(
      fontFamily: appFontFamily,
      fontSize: 20.sp,
      fontWeight: isSemiBold ? FontWeight.w600 : FontWeight.w700,
      color: textColor,
      height: 1.3,
    );
  }

  static TextStyle PoppinsH1(
      {required Color textColor, bool isSemiBold = true}) {
    return TextStyle(
      fontFamily: appFontFamily,
      fontSize: 24.sp,
      fontWeight: isSemiBold ? FontWeight.w600 : FontWeight.w700,
      color: textColor,
      height: 1.09,
    );
  }
}
