import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/constants.dart';
import '../../../core/prefs/shared_pref_controller.dart';
import '../../router/app_router.dart';
import '../widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
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
                    child: Text('Create an account',
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
                          'Give us some of your information for shopping to Fixturez store',
                          overflow: TextOverflow.fade,
                          style: AppTextStyles.PoppinsBody2(
                              textColor: AppColors.primaryGreyColor)),
                    ),
                  ),
                  SizedBox(height: 50.h),
                  const SignUpForm(),
                  SizedBox(height: 16.h),
                  termsAndConditionsText(),
                  SizedBox(height: 37.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  RichText termsAndConditionsText() {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.PoppinsFootnote(textColor: AppColors.primaryColor),
        children: <TextSpan>[
          const TextSpan(text: 'By tapping “Sign Up” you accept our '),
          TextSpan(
              text: 'Terms of Service',
              style: AppTextStyles.PoppinsFootnote(
                  textColor: AppColors.secondaryColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('terms and condition');
                }),
        ],
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late TextEditingController _emailTextcontroller;
  late TextEditingController _passwordTextcontroller;
  late TextEditingController _conformedPasswordTextcontroller;
  late TextEditingController _userNameTextcontroller;
  late TextEditingController _phoneNumberTextcontroller;
  late TextEditingController _nameTextcontroller;

  @override
  void initState() {
    super.initState();
    _emailTextcontroller = TextEditingController();
    _passwordTextcontroller = TextEditingController();
    _conformedPasswordTextcontroller = TextEditingController();
    _userNameTextcontroller = TextEditingController();
    _phoneNumberTextcontroller = TextEditingController();
    _nameTextcontroller = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextcontroller.dispose();
    _passwordTextcontroller.dispose();
    _conformedPasswordTextcontroller.dispose();
    _userNameTextcontroller.dispose();
    _phoneNumberTextcontroller.dispose();
    _nameTextcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputTextField(
          controller: _userNameTextcontroller,
          hintText: "Enter your Username",
          labelText: "Username",
        ),
        SizedBox(height: 25.h),
        InputTextField(
          controller: _emailTextcontroller,
          hintText: "Enter your Email",
          labelText: "Email",
          textInputType: TextInputType.emailAddress,
        ),
        SizedBox(height: 25.h),
        InputTextField(
          controller: _nameTextcontroller,
          hintText: "Enter your Name",
          labelText: "Full Name",
          textInputType: TextInputType.name,
        ),
        SizedBox(height: 25.h),
        InputTextField(
          controller: _phoneNumberTextcontroller,
          hintText: "Enter your Phone Number",
          labelText: "Phone Number",
          textInputType: TextInputType.name,
        ),
        SizedBox(height: 25.h),
        InputTextField(
          controller: _passwordTextcontroller,
          hintText: "Enter your password",
          labelText: "Password",
          suffixIcon: AppIcons.customIcon(
            iconName: 'ic_eye_slash',
            iconColor: AppColors.primaryGreyColor,
          ),
          obscureText: true,
        ),
        SizedBox(height: 25.h),
        InputTextField(
          controller: _conformedPasswordTextcontroller,
          hintText: "Conform your password",
          labelText: "Password",
          suffixIcon: AppIcons.customIcon(
              iconName: 'ic_eye_slash', iconColor: AppColors.primaryGreyColor),
          obscureText: true,
        ),
        SizedBox(
          height: 20.h,
        ),
        DefaultButton(press: performLogin, text: "Sign Up"),
      ],
    );
  }

  void performLogin() {
    if (chechData()) {
      return login();
    }
  }

  bool chechData() {
    if (_emailTextcontroller.text.isNotEmpty &&
        _passwordTextcontroller.text.isNotEmpty &&
        _nameTextcontroller.text.isNotEmpty &&
        _conformedPasswordTextcontroller.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void login() async {
    await SharedPrefController().save(email: _emailTextcontroller.text);
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, AppRouter.home);
    });
  }
}
