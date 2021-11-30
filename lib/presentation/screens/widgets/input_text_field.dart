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
  }) : super(key: key);

  final String labelText;
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? textButtonAsSuffixIcon;

  static OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.primaryColor),
    gapPadding: 5,
  );
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      obscuringCharacter: 'X',
      decoration: InputDecoration(
        labelStyle:
            AppTextStyles.PoppinsBody1(textColor: AppColors.primaryColor),
        hintStyle:
            AppTextStyles.PoppinsBody1(textColor: AppColors.primaryColor),
        labelText: labelText,
        hintText: hintText,
        alignLabelWithHint: true,
        suffixIcon: suffixIcon,

        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding: EdgeInsets.fromLTRB(16.w, 20.h, 20.w, 20.h),
        // enabledBorder: outlineInputBorder,
        // focusedBorder: outlineInputBorder,
        // border: outlineInputBorder,
        focusColor: AppColors.darkColor,
      ),
    );
  }
}
