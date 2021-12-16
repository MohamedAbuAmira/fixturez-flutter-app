import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/web_services/web_services.dart';
import '../../../core/constants/constants.dart';
import '../../../core/helpers/helpers.dart';
import '../widgets/widgets.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen>
    with Helpers {
  late TextEditingController _currentPasswordTextController;
  late TextEditingController _newPasswordTextController;
  late TextEditingController _newPasswordConfirmationTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentPasswordTextController = TextEditingController();

    _newPasswordTextController = TextEditingController();
    _newPasswordConfirmationTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _currentPasswordTextController.dispose();
    _newPasswordTextController.dispose();
    _newPasswordConfirmationTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Close",
                style: AppTextStyles.PoppinsBody2(
                    textColor: AppColors.secondaryGreyColor)),
          ),
          actions: [
            TextButton(
              onPressed: () async => await performChangePassword(),
              child: Text("Save",
                  style: AppTextStyles.PoppinsBody2(
                      textColor: AppColors.secondaryColor)),
            ),
          ],
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Change Your Password',
                          textAlign: TextAlign.start,
                          style: AppTextStyles.PoppinsH1(
                              textColor: AppColors.darkColor)),
                    ),
                    SizedBox(height: 25.h),
                    InputTextField(
                      controller: _currentPasswordTextController,
                      hintText: "Enter your current Password",
                      labelText: "Current Password",
                      editingTextColor: AppColors.primaryColor,
                      suffixIcon: AppIcons.customIcon(
                          iconName: 'ic_eye_slash',
                          iconColor: AppColors.primaryColor),
                      obscureText: true,
                    ),
                    SizedBox(height: 25.h),
                    InputTextField(
                      controller: _newPasswordTextController,
                      hintText: "Enter your New Password",
                      labelText: "New Password",
                      editingTextColor: AppColors.primaryColor,
                      suffixIcon: AppIcons.customIcon(
                          iconName: 'ic_eye_slash',
                          iconColor: AppColors.primaryColor),
                      obscureText: true,
                    ),
                    SizedBox(height: 25.h),
                    InputTextField(
                      controller: _newPasswordConfirmationTextController,
                      hintText: "Confirm your New Password",
                      labelText: "New Password Confirmation",
                      editingTextColor: AppColors.primaryColor,
                      suffixIcon: AppIcons.customIcon(
                          iconName: 'ic_eye_slash',
                          iconColor: AppColors.primaryColor),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    DefaultButton(
                      text: "Change Password",
                      press: () async => await performChangePassword(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Future<void> performChangePassword() async {
    if (checkData()) {
      await _showMyDialog();
    }
  }

  bool checkData() {
    if (checkPassword()) {
      return true;
    }
    return false;
  }

  bool checkPassword() {
    if (_newPasswordTextController.text.isNotEmpty &&
        _currentPasswordTextController.text.isNotEmpty &&
        _newPasswordConfirmationTextController.text.isNotEmpty) {
      if (_newPasswordTextController.text ==
          _newPasswordConfirmationTextController.text) {
        return true;
      }
      showSnackBar(
          context: context, message: 'Change Password error!', error: true);
      return false;
    }
    showSnackBar(context: context, message: 'Enter new password!', error: true);
    return false;
  }

//
  Future<void> changePassword() async {
    final Map<String, String> changetPasswordDetails = {};
    changetPasswordDetails['current_password'] =
        _currentPasswordTextController.text;
    changetPasswordDetails['new_password'] = _newPasswordTextController.text;
    changetPasswordDetails['new_password_confirmation'] =
        _newPasswordTextController.text;

    Map authBaseResponse = await UpdateProfileWebService().changePassword(
      context,
      changetPasswordDetails: changetPasswordDetails,
    );
    if (authBaseResponse['status']) {
      Navigator.pop(context);
    } else {}
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 24.h),
          actionsPadding: EdgeInsets.fromLTRB(32.w, 40.h, 32.w, 16.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          title: Text('Are you sure?',
              style: AppTextStyles.PoppinsBody2(textColor: AppColors.darkColor),
              textAlign: TextAlign.center),
          content: Text(
            "You are about to change your password. Please double check it again.",
            style: AppTextStyles.PoppinsBody2(
                textColor: AppColors.primaryGreyColor),
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            DefaultButton(
              width: 80.w,
              text: "Yes, I'm Sure",
              press: () {
                Navigator.pop(context);
                changePassword();
              },
            ),
            DefaultButton(
              width: 80.w,
              primaryColor: AppColors.tertiaryGreyColor,
              textColor: AppColors.primaryGreyColor,
              text: "Cancel",
              press: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }
}
