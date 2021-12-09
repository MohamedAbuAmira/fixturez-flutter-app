import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/constants.dart';

class ViewAllHeader extends StatelessWidget {
  const ViewAllHeader({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppTextStyles.PoppinsBody2(textColor: AppColors.darkColor),
          ),
          TextButton(
              onPressed: onPressed,
              child: Text(
                "View All",
                style: AppTextStyles.PoppinsFootnote(
                    textColor: const Color(0xFF007AFF)),
              ))
        ],
      ),
    );
  }
}
