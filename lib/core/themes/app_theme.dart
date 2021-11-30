import 'package:fixturez/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const String appFontFamily = "Poppins";

  const AppTheme._();
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: appFontFamily,
    appBarTheme: appBarTheme(),

    // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: lightAccentColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static AppBarTheme appBarTheme() {
    return const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.darkColor),
      titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      // brightness: Brightness.light,
    );
  }

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey[900],
    fontFamily: appFontFamily,
    appBarTheme: appBarTheme(),
    // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: darkAccentColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
