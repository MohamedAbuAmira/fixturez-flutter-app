import 'package:fixturez/core/constants/constants.dart';
import 'package:fixturez/presentation/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/prefs/shared_pref_controller.dart';
import '../../../data/web_services/user_web_service.dart';
import '../../router/app_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // appBar: AppBar(
      //   actions: [
      //     IconButton(onPressed: () async => await performLogout(), icon: Icon(Icons.logout))
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(6.r)),
                child: AppIcons.customIcon(iconName: "ic_user_placeholder"),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(SharedPrefController().fullName,
                  style: AppTextStyles.PoppinsH4(
                      textColor: AppColors.darkColor, isSemiBold: true)),
              SizedBox(
                height: 1.h,
              ),
              Text(SharedPrefController().email,
                  style:
                      AppTextStyles.PoppinsH4(textColor: AppColors.darkColor)),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 120.w,
                height: 40.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border:
                        Border.all(width: 1, color: AppColors.primaryColor)),
                child: TextButton(
                  child: Text(
                    "Edit Profile",
                    style: AppTextStyles.PoppinsSubtitle(
                        textColor: AppColors.primaryColor),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.updateProfile);
                  },
                ),
              ),
              _buttonsUserProfile(),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buttonsUserProfile() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Profile",
            style: AppTextStyles.PoppinsSubtitle(
                textColor: AppColors.darkColor, isMedium: false),
          ),
          SizedBox(
            height: 5.h,
          ),
          _tabButtonItem(
              ItemIconName: 'profile_order',
              itemName: 'My Orders',
              onpress: () {}),
          const Divider(
            color: AppColors.secondaryGreyColor,
          ),
          _tabButtonItem(
              ItemIconName: 'profile_password',
              itemName: 'Change Password',
              onpress: () {
                Navigator.pushNamed(context, AppRouter.changePassword);
              }),
          const Divider(
            color: AppColors.secondaryGreyColor,
          ),
          _tabButtonItem(
              ItemIconName: 'profile_help_center',
              itemName: 'Settings',
              onpress: () {}),
          const Divider(
            color: AppColors.secondaryGreyColor,
          ),
          _tabButtonItem(
            ItemIconName: 'profile_share',
            itemName: 'Refer & Earn',
            onpress: () {
              Navigator.pushNamed(context, AppRouter.share);
            },
          ),
          const Divider(
            color: AppColors.secondaryGreyColor,
          ),
          _tabButtonItem(
              ItemIconName: 'profile_support',
              itemName: 'Customer Support',
              onpress: () {}),
          const Divider(
            color: AppColors.secondaryGreyColor,
          ),
          _tabButtonItem(
              ItemIconName: 'profile_faq', itemName: 'FAQs', onpress: () {}),
          const Divider(
            color: AppColors.secondaryGreyColor,
          ),
          _tabButtonItem(
              ItemIconName: 'profile_privacy',
              itemName: 'Privacy Policy',
              onpress: () {}),
          const Divider(
            color: AppColors.secondaryGreyColor,
          ),
          _tabButtonItem(
            ItemIconName: 'profile_logout',
            itemName: 'Log out',
            onpress: () {
              _logoutModalSheet();
            },
          ),
          SizedBox(
            height: 85.h,
          )
        ],
      ),
    );
  }

  Future<void> _logoutModalSheet() {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r))),
          height: 280.h,
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(2.w, 2.h, 2.w, 12.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 44.w,
                    height: 5.h,
                    color: AppColors.tertiaryGreyColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Log Out',
                        style: AppTextStyles.PoppinsH2(
                            textColor: AppColors.darkColor)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Are you sure you want to log out?',
                        style: AppTextStyles.PoppinsH2(
                            textColor: AppColors.primaryGreyColor)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefaultButton(
                      text: "Yes, log Out",
                      press: () async => await performLogout(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefaultButton(
                      primaryColor: AppColors.tertiaryGreyColor,
                      textColor: AppColors.primaryGreyColor,
                      text: "Cancel",
                      press: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _tabButtonItem(
      {required String ItemIconName,
      required String itemName,
      required VoidCallback onpress}) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              AppIcons.customIcon(iconName: ItemIconName),
              SizedBox(
                width: 6.w,
              ),
              Text(
                itemName,
                style: AppTextStyles.PoppinsSubtitle(
                    textColor: AppColors.darkColor),
              ),
            ],
          ),
          IconButton(
            icon: AppIcons.customIcon(
                iconName: "ic_right(1)", iconColor: AppColors.darkColor),
            onPressed: onpress,
          ),
        ],
      ),
    );
  }

  Future<void> performLogout() async {
    Map authBaseResponse = await UserWebService().logout(context);

    if (authBaseResponse['status']) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushNamed(
          context,
          AppRouter.login,
        );
      });
    } else {
      // print('error');
    }
  }
}
