import 'package:fixturez/core/constants/constants.dart';
import 'package:fixturez/core/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcons.customIcon(iconName: "Shopping_Vector"),
            SizedBox(
              height: 4.h,
            ),
            Text(
              "You have no items in your shopping cart.",
              // textAlign: TextAlign.center,
              style: AppTextStyles.PoppinsH3(textColor: AppColors.darkColor),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              "Discover the way to Fixturez your self at affordable price!",
              // textAlign: TextAlign.center,
              style: AppTextStyles.PoppinsBody2(
                  textColor: AppColors.primaryGreyColor),
            ),
            SizedBox(
              height: 4.h,
            ),
            Container(
              height: 59.h,
              width: 200.w,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.primaryColor),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Start Shopping",
                    style: AppTextStyles.PoppinsH4(
                        textColor: AppColors.whiteColor),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
