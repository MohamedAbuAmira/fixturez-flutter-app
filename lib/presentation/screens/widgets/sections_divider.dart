import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/constants.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({
    Key? key,
    this.addMargin = false,
  }) : super(key: key);
  final bool addMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: addMargin ? EdgeInsets.only(top: 20.h) : EdgeInsets.zero,
      color: AppColors.tertiaryGreyColor,
      height: 6.h,
      width: double.infinity,
    );
  }
}
