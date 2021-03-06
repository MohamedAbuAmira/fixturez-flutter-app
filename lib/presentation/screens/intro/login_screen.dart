import '../../../core/constants/constants.dart';
import '../../../core/helpers/helpers.dart';
import '../../../data/web_services/web_services.dart';
import '../../../presentation/router/app_router.dart';
import '../../../presentation/screens/widgets/widgets.dart';
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Welcome to FixTurez',
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
                          'Want to shopping with us please login to Fixturez store',
                          overflow: TextOverflow.fade,
                          style: AppTextStyles.PoppinsBody2(
                              textColor: AppColors.primaryGreyColor)),
                    ),
                  ),
                  SizedBox(height: 50.h),
                  const LoginInForm(),
                  SizedBox(height: 8.h),
                  Container(
                    height: 58.h,
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRouter.forgotPassword);
                      },
                      child: Text(
                        "Forgot Password?",
                        style: AppTextStyles.PoppinsBody2(
                            textColor: AppColors.secondaryColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Or connect with",
                    style: AppTextStyles.PoppinsFootnote(
                        textColor: AppColors.primaryGreyColor),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {},
                          child: AppIcons.customIcon(iconName: 'gplus')),
                      SizedBox(
                        width: 16.w,
                      ),
                      InkWell(
                          onTap: () {},
                          child: AppIcons.customIcon(iconName: 'fb')),
                    ],
                  ),
                  SizedBox(height: 39.h),
                  const NoAccountText(),
                  SizedBox(height: 37.h),
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

class _LoginInFormState extends State<LoginInForm> with Helpers {
  late TextEditingController _phoneNumberTextController;
  late TextEditingController _passwordTextcontroller;

  @override
  void initState() {
    super.initState();
    _phoneNumberTextController = TextEditingController();
    _passwordTextcontroller = TextEditingController();
  }

  @override
  void dispose() {
    _phoneNumberTextController.dispose();
    _passwordTextcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputTextField(
          controller: _phoneNumberTextController,
          hintText: "Enter your Phone Number",
          labelText: "Phone Number",
          textInputType: TextInputType.phone,
        ),
        SizedBox(height: 25.h),
        InputTextField(
          controller: _passwordTextcontroller,
          hintText: "Enter your Password",
          labelText: "Password",
          editingTextColor: AppColors.primaryColor,
          cursorColor: AppColors.primaryColor,
          suffixIcon: AppIcons.customIcon(
              iconName: 'ic_eye_slash', iconColor: AppColors.primaryColor),
          obscureText: true,
        ),
        SizedBox(
          height: 20.h,
        ),
        DefaultButton(press: () async => await performLogin(), text: "Log In"),
      ],
    );
  }

  Future<void> performLogin() async {
    if (chechData()) {
      return login();
    }
  }

  bool chechData() {
    if (_phoneNumberTextController.text.isNotEmpty &&
        _passwordTextcontroller.text.isNotEmpty) {
      return true;
    } else {
      showSnackBar(
        context: context,
        message: 'Enter required data!',
        error: true,
      );
      return false;
    }
  }

  Future<void> login() async {
    final Map<String, String> loginDetails = {};
    loginDetails['mobile'] = _phoneNumberTextController.text;
    loginDetails['password'] = _passwordTextcontroller.text;
    Map authBaseResponse =
        await UserWebService().login(context, loginDetails: loginDetails);
    if (authBaseResponse['status']) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, AppRouter.home);
      });
    } else {}
  }
}
