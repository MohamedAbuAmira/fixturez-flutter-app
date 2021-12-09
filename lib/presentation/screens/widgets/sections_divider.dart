import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/constants.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      color: AppColors.tertiaryGreyColor,
      height: 6.h,
      width: double.infinity,
    );
  }
}
