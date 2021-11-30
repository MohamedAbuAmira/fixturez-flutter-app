import 'package:fixturez/core/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class GlowingActionButton extends StatelessWidget {
  const GlowingActionButton({
    Key? key,
    required this.color,
    required this.iconName,
    this.size = 56,
    required this.onPressed,
  }) : super(key: key);

  final Color color;
  final String iconName;
  final double size;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Material(
          color: color,
          child: InkWell(
            splashColor: AppColors.tertiaryGreyColor,
            onTap: onPressed,
            child: SizedBox(
                width: size.w,
                height: size.h,
                child: AppIcons.customIcon(
                    iconName: iconName, iconColor: AppColors.whiteColor)),
          ),
        ),
      ),
    );
  }
}
