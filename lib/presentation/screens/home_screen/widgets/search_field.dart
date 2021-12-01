import 'package:fixturez/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52.h,
      decoration: BoxDecoration(
        color: AppColors.tertiaryGreyColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: TextField(
          onChanged: (value) => print(value),
          cursorColor: AppColors.darkColor,
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 50.w, vertical: 15.h),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search",
            hintStyle: AppTextStyles.PoppinsSubtitle(
                textColor: AppColors.primaryGreyColor),
            prefixIcon: AppIcons.customIcon(
                iconName: "ic_Search", iconColor: Colors.black),
            prefixIconConstraints:
                BoxConstraints(maxHeight: 24.h, minWidth: 24.w),
          )),
    );
  }
}
