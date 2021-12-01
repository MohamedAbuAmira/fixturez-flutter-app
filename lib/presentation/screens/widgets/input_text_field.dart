import 'package:fixturez/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.suffixIcon,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.textButtonAsSuffixIcon,
    required this.controller,
    this.editingTextColor = AppColors.darkColor,
    this.cursorColor = AppColors.darkColor,
  }) : super(key: key);

  final String labelText;
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? textButtonAsSuffixIcon;
  final Color editingTextColor;
  final Color cursorColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      obscuringCharacter: 'X',
      cursorColor: cursorColor,
      style: AppTextStyles.PoppinsBody2(textColor: editingTextColor),
      decoration: InputDecoration(
        labelStyle:
            AppTextStyles.PoppinsBody1(textColor: AppColors.secondaryGreyColor),
        hintStyle:
            AppTextStyles.PoppinsBody1(textColor: AppColors.secondaryGreyColor),
        labelText: labelText,
        hintText: hintText,
        alignLabelWithHint: true,
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints(maxHeight: 28.h, maxWidth: 28.w),
        // floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding: EdgeInsets.fromLTRB(2.w, 16.h, 14.w, 20.h),
        // enabledBorder: const UnderlineInputBorder(
        //   borderSide: BorderSide(color: AppColors.primaryColor),
        // ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.tertiaryGreyColor),
        ),
        focusColor: AppColors.darkColor,
      ),
    );
  }
}
