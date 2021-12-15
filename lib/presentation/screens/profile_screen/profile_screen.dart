import 'package:fixturez/core/constants/constants.dart';
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
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async => await performLogout(),
              icon: Icon(Icons.logout))
        ],
        title: Text("Profile"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(6.r)),
              child: AppIcons.customIcon(iconName: "ic_user_placeholder"),
            ),
            Text("Email"),
            Text("name"),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(width: 1, color: AppColors.primaryColor)),
              child: Text("Edit Profile"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Text("Profile"),
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
                      onpress: () {}),
                  _tabButtonItem(
                      ItemIconName: 'profile_help_center',
                      itemName: 'Settings',
                      onpress: () {}),
                  _tabButtonItem(
                      ItemIconName: 'profile_share',
                      itemName: 'Refer & Earn',
                      onpress: () {}),
                  _tabButtonItem(
                      ItemIconName: 'profile_support',
                      itemName: 'Customer Support',
                      onpress: () {}),
                  _tabButtonItem(
                      ItemIconName: 'profile_faq',
                      itemName: 'FAQs',
                      onpress: () {}),
                  _tabButtonItem(
                      ItemIconName: 'profile_privacy',
                      itemName: 'Privacy Policy',
                      onpress: () {}),
                  _tabButtonItem(
                      ItemIconName: 'profile_logout',
                      itemName: 'Log out',
                      onpress: () {}),
                ],
              ),
            ),
          ],
        ),
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

  Widget _tabButtonItem(
      {required String itemName,
      required String ItemIconName,
      required VoidCallback onpress}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppIcons.customIcon(iconName: ItemIconName),
        SizedBox(
          width: 4.w,
        ),
        Text(ItemIconName),
        IconButton(
          icon: AppIcons.customIcon(iconName: "ic_right(1)"),
          onPressed: onpress,
        ),
      ],
    );
  }
}
