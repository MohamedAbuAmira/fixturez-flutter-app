import 'package:fixturez/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
    this.width = double.infinity,
    this.primaryColor = AppColors.primaryColor,
    this.textColor = AppColors.whiteColor,
  }) : super(key: key);
  final String text;
  final VoidCallback press;
  final double width;
  final Color primaryColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 58.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          primary: primaryColor,
          onPrimary: Colors.white,
          shadowColor: AppColors.tertiaryGreyColor,
          textStyle: AppTextStyles.PoppinsH4(textColor: textColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        onPressed: press,
        child: Text(
          text,
        ),
      ),
    );
  }
}
