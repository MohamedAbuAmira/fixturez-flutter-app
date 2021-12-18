import 'package:fixturez/core/constants/constants.dart';
import 'package:fixturez/core/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShareScreen extends StatelessWidget {
  const ShareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Share",
          style: AppTextStyles.PoppinsH3(textColor: AppColors.darkColor),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: AppIcons.customIcon(iconName: "ic_back"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcons.customIcon(iconName: "Refer_Vector"),
            SizedBox(
              height: 24.h,
            ),
            Text(
              "Share with friends",
              // textAlign: TextAlign.center,
              style: AppTextStyles.PoppinsH3(textColor: AppColors.darkColor),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Refer to your friend and get Get a cash reward of \$5",
              // textAlign: TextAlign.center,
              style: AppTextStyles.PoppinsBody2(
                  textColor: AppColors.primaryGreyColor),
            ),
            SizedBox(
              height: 25.h,
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
                    "Share Now",
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
