import 'package:fixturez/core/constants/constants.dart';
import 'package:fixturez/core/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
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
            AppIcons.customIcon(iconName: "Notification_Vector"),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "No notification",
              // textAlign: TextAlign.center,
              style: AppTextStyles.PoppinsH3(textColor: AppColors.darkColor),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "You have no new notification yet",
              // textAlign: TextAlign.center,
              style: AppTextStyles.PoppinsBody2(
                  textColor: AppColors.primaryGreyColor),
            ),
          ],
        ),
      ),
    );
  }
}
