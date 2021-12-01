import 'package:fixturez/presentation/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/constants.dart';
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
                            'Enter your mail id or phone number to reset your password',
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

class _ForgotPassFormState extends State<ForgotPassForm> {
  late TextEditingController _emailTextcontroller;
  @override
  void initState() {
    super.initState();
    _emailTextcontroller = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InputTextField(
          controller: _emailTextcontroller,
          hintText: "Enter your email",
          labelText: "Email",
          textInputType: TextInputType.emailAddress,
        ),
        SizedBox(height: 20.h),
        DefaultButton(
          text: "Reset Password",
          press: () {
            {
              // Navigator.pushNamed(context, AppRouter.changePassword);
            }
          },
        ),
      ],
    );
  }
}
