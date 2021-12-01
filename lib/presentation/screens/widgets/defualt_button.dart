import 'package:fixturez/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final Function() press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          primary: AppColors.primaryColor,
          onPrimary: Colors.white,
          shadowColor: AppColors.tertiaryGreyColor,
          textStyle: AppTextStyles.PoppinsH4(textColor: AppColors.whiteColor),
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
