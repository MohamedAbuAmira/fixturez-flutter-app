import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppIcons {
  AppIcons._();

  static SvgPicture customIcon(
      {required String iconName,
      Color? iconColor,
      double? height,
      double? width}) {
    String iconPath = 'assets/icons/$iconName.svg';
    return SvgPicture.asset(
      iconPath,
      color: iconColor,
      width: width,
      height: height,
    );
  }
}
