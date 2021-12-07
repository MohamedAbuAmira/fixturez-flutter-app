import '../../../core/helpers/helpers.dart';
import '../../../presentation/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/constants.dart';
import '../../../data/web_services/web_services.dart';
import '../../router/app_router.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: AppIcons.customIcon(iconName: "ic_back"),
          ),
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
                      child: Text('Forgot Password',
                          textAlign: TextAlign.start,
                          style: AppTextStyles.PoppinsH1(
                              textColor: AppColors.darkColor)),
                    ),
                    SizedBox(height: 16.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 315.w,
                        height: 48.h,
                        child: Text(
                            'Enter your phone number to reset your password',
                            overflow: TextOverflow.fade,
                            style: AppTextStyles.PoppinsBody2(
                                textColor: AppColors.primaryGreyColor)),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    const ForgotPassForm(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> with Helpers {
  late TextEditingController _phoneNumberTextController;
  @override
  void initState() {
    super.initState();
    _phoneNumberTextController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneNumberTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InputTextField(
          controller: _phoneNumberTextController,
          hintText: "Enter your phone number",
          labelText: "Phone Number",
          textInputType: TextInputType.phone,
        ),
        SizedBox(height: 20.h),
        DefaultButton(
          text: "Reset Password",
          press: () async => await performForgotPassword(),
        ),
      ],
    );
  }

  Future<void> performForgotPassword() async {
    if (chechData()) {
      await sendPhoneNumber();
    }
  }

  bool chechData() {
    if (_phoneNumberTextController.text.isNotEmpty) {
      return true;
    } else {
      showSnackBar(
          context: context, message: "Enter required data", error: true);
      return false;
    }
  }

  Future<void> sendPhoneNumber() async {
    Map authBaseResponse = await UserWebService()
        .forgotPassword(context, phoneNumber: _phoneNumberTextController.text);

    if (authBaseResponse['status']) {
      final String resetPasswordCode = authBaseResponse['code'].toString();

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, AppRouter.resetPassword,
            arguments: {
              'code': resetPasswordCode,
              'phoneNumber': _phoneNumberTextController.text
            });
      });
    } else {}
  }
}
