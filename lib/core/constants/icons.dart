import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class AppIcons {
  AppIcons._();

  static SvgPicture customIcon(
      {required String iconName, Color? iconColor = null, int iconSize = 24}) {
    String iconPath = 'assets/icons/ic_$iconName.svg';
    return SvgPicture.asset(iconPath, color: iconColor);
  }
}
