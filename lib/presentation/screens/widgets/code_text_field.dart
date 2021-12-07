import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/constants.dart';

class CodeTextField extends StatelessWidget {
  const CodeTextField({
    Key? key,
    required this.textEditingController,
    required this.focusNode,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final void Function(String value) onChanged;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      focusNode: focusNode,
      maxLength: 1,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      onChanged: onChanged,
      style: AppTextStyles.PoppinsBody2(
          textColor: AppColors.darkColor, isRegular: false),
      cursorColor: AppColors.darkColor,
      decoration: InputDecoration(
        counterText: '',
        focusColor: AppColors.darkColor,
        enabledBorder: border(borderColor: AppColors.tertiaryGreyColor),
        focusedBorder: border(borderColor: AppColors.primaryColor),
      ),
    );
  }

  UnderlineInputBorder border({required Color borderColor}) {
    return UnderlineInputBorder(
      borderRadius: BorderRadius.horizontal(
          left: Radius.circular(65.r), right: Radius.circular(65.r)),
      borderSide: BorderSide(color: borderColor, width: 3),
    );
  }
}
