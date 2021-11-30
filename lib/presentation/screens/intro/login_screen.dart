import 'package:fixturez/core/constants/constants.dart';
import 'package:fixturez/core/prefs/shared_pref_controller.dart';
import 'package:fixturez/presentation/router/app_router.dart';
import 'package:fixturez/presentation/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Welcome to FixTurez',
                      style: AppTextStyles.PoppinsH1(
                          textColor: AppColors.darkColor)),
                  Text(
                      'want to shopping with us please login to Fixturez store',
                      style: AppTextStyles.PoppinsBody2(
                          textColor: AppColors.primaryGreyColor)),
                  SizedBox(height: 50.h),
                  const LoginInForm(),
                  SizedBox(height: 48.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginInForm extends StatefulWidget {
  const LoginInForm({Key? key}) : super(key: key);

  @override
  _LoginInFormState createState() => _LoginInFormState();
}

class _LoginInFormState extends State<LoginInForm> {
  late TextEditingController _emailTextcontroller;
  late TextEditingController _passwordTextcontroller;

  @override
  void initState() {
    super.initState();
    _emailTextcontroller = TextEditingController();
    _passwordTextcontroller = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextcontroller.dispose();
    _passwordTextcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputTextField(
          controller: _emailTextcontroller,
          hintText: "Enter your email",
          labelText: "Email",
          textInputType: TextInputType.emailAddress,
        ),
        SizedBox(height: 25.h),
        InputTextField(
          controller: _passwordTextcontroller,
          hintText: "Enter your password",
          labelText: "Password",
          suffixIcon: AppIcons.customIcon(iconName: 'Heart'),
          textButtonAsSuffixIcon: TextButton(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.forgotPassword);
              },
              child: const Text('Forgot?')),
          obscureText: true,
        ),
        SizedBox(
          height: 40.h,
        ),
        const NoAccountText(),
        SizedBox(
          height: 95.h,
        ),
        DefaultButton(press: performLogin, text: "Log In"),
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
        _passwordTextcontroller.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void login() async {
    print(_emailTextcontroller.text);
    await SharedPrefController().save(email: _emailTextcontroller.text);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRouter.home);
    });
  }
}
