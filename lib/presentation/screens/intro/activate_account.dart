import 'package:fixturez/core/helpers/helpers.dart';
import 'package:fixturez/data/web_services/user_web_service.dart';
import 'package:fixturez/presentation/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/constants.dart';
import '../../router/app_router.dart';

class ActivateAccountScreen extends StatefulWidget {
  const ActivateAccountScreen({Key? key, required this.activateAccountCode})
      : super(key: key);
  final String activateAccountCode;

  @override
  State<ActivateAccountScreen> createState() => _ActivateAccountScreenState();
}

class _ActivateAccountScreenState extends State<ActivateAccountScreen>
    with Helpers {
  late TextEditingController _activationCodeTextController;
  late TextEditingController _phoneNumberTextcontroller;
  @override
  void initState() {
    super.initState();
    _activationCodeTextController = TextEditingController();
    _phoneNumberTextcontroller = TextEditingController();
  }

  @override
  void dispose() {
    _activationCodeTextController.dispose();
    _phoneNumberTextcontroller.dispose();
    super.dispose();
  }

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
                      child: Text('Activate Your Account',
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
                            'Enter your verfication code to active your account',
                            overflow: TextOverflow.fade,
                            style: AppTextStyles.PoppinsBody2(
                                textColor: AppColors.primaryGreyColor)),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    InputTextField(
                      controller: _phoneNumberTextcontroller,
                      hintText: "Enter your Phone Number",
                      labelText: "Phone Number",
                      textInputType: TextInputType.phone,
                    ),
                    SizedBox(height: 25.h),
                    InputTextField(
                      controller: _activationCodeTextController,
                      hintText: "Enter your activation code",
                      labelText: "Code",
                      textInputType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    DefaultButton(
                        press: () {
                          showSnackBar(
                              context: context,
                              message:
                                  "Your Activation code is ${widget.activateAccountCode}",
                              hideAction: true,
                              durationInSeconds: 180);
                        },
                        text: "Show Activation Code"),
                    SizedBox(height: 20.h),
                    DefaultButton(
                      text: "Activate Account",
                      press: () async => await performActivation(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Future<void> performActivation() async {
    if (chechData()) {
      await activation();
    }
  }

  bool chechData() {
    if (_activationCodeTextController.text.isNotEmpty &&
        _phoneNumberTextcontroller.text.isNotEmpty) {
      return true;
    } else {
      showSnackBar(
          context: context, message: "Enter required data", error: true);
      return false;
    }
  }

  Future<void> activation() async {
    final Map<String, String> activateDetails = {};
    activateDetails['mobile'] = _phoneNumberTextcontroller.text;
    activateDetails['code'] = _activationCodeTextController.text;
    Map authBaseResponse = await UserWebService()
        .activate(context, activateDetails: activateDetails);

    if (authBaseResponse['status']) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushNamed(
          context,
          AppRouter.login,
        );
      });
    } else {}
  }
}
