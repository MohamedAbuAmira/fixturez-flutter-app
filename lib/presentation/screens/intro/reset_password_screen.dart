import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/web_services/web_services.dart';
import '../../../core/constants/constants.dart';
import '../../../core/helpers/helpers.dart';
import '../widgets/widgets.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key, required this.resetPasswordDetails})
      : super(key: key);
  final Map<String, String> resetPasswordDetails;
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen>
    with Helpers {
  late TextEditingController _newPasswordTextController;
  late TextEditingController _newPasswordConfirmationTextController;

  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;

  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;

  String? _code;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstCodeTextController = TextEditingController();
    _secondCodeTextController = TextEditingController();
    _thirdCodeTextController = TextEditingController();
    _fourthCodeTextController = TextEditingController();

    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();

    _newPasswordTextController = TextEditingController();
    _newPasswordConfirmationTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _firstCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();

    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();

    _newPasswordTextController.dispose();
    _newPasswordConfirmationTextController.dispose();
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
                      child: Text('Reset Your Password',
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
                            'Enter your verfication code to reset your password, and enter the new password',
                            overflow: TextOverflow.fade,
                            style: AppTextStyles.PoppinsBody2(
                                textColor: AppColors.primaryGreyColor)),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    resetPasswordCodeInputFeilds(),
                    SizedBox(height: 25.h),
                    InputTextField(
                      controller: _newPasswordTextController,
                      hintText: "Enter your Password",
                      labelText: "Password",
                      editingTextColor: AppColors.primaryColor,
                      suffixIcon: AppIcons.customIcon(
                          iconName: 'ic_eye_slash',
                          iconColor: AppColors.primaryColor),
                      obscureText: true,
                    ),
                    SizedBox(height: 25.h),
                    InputTextField(
                      controller: _newPasswordConfirmationTextController,
                      hintText: "Confirm your Password",
                      labelText: "Password Confirmation",
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
                        press: () {
                          showSnackBar(
                              context: context,
                              message:
                                  "Your Reset code is ${widget.resetPasswordDetails['code']}",
                              hideAction: true,
                              durationInSeconds: 180);
                        },
                        text: "Show Reset Code"),
                    SizedBox(height: 20.h),
                    DefaultButton(
                      text: "Reset Password",
                      press: () async => await performResetPassword(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Row resetPasswordCodeInputFeilds() {
    return Row(
      children: [
        Expanded(
          child: CodeTextField(
            textEditingController: _firstCodeTextController,
            focusNode: _firstFocusNode,
            onChanged: (value) {
              if (value.isNotEmpty) {
                _secondFocusNode.requestFocus();
              }
            },
          ),
        ),
        SizedBox(width: 19.w),
        Expanded(
          child: CodeTextField(
            textEditingController: _secondCodeTextController,
            focusNode: _secondFocusNode,
            onChanged: (value) {
              value.isNotEmpty
                  ? _thirdFocusNode.requestFocus()
                  : _firstFocusNode.requestFocus();
            },
          ),
        ),
        SizedBox(width: 19.w),
        Expanded(
          child: CodeTextField(
            textEditingController: _thirdCodeTextController,
            focusNode: _thirdFocusNode,
            onChanged: (value) {
              value.isNotEmpty
                  ? _fourthFocusNode.requestFocus()
                  : _secondFocusNode.requestFocus();
            },
          ),
        ),
        SizedBox(width: 19.w),
        Expanded(
          child: CodeTextField(
            textEditingController: _fourthCodeTextController,
            focusNode: _fourthFocusNode,
            onChanged: (value) {
              if (value.isEmpty) _thirdFocusNode.requestFocus();
            },
          ),
        ),
      ],
    );
  }

  Future<void> performResetPassword() async {
    if (checkData()) {
      await resetPassword();
    }
  }

  bool checkData() {
    if (checkCode() && checkPassword()) {
      return true;
    }
    return false;
  }

  bool checkPassword() {
    if (_newPasswordTextController.text.isNotEmpty &&
        _newPasswordConfirmationTextController.text.isNotEmpty) {
      if (_newPasswordTextController.text ==
          _newPasswordConfirmationTextController.text) {
        return true;
      }
      showSnackBar(
          context: context,
          message: 'Password confirmation error!',
          error: true);
      return false;
    }
    showSnackBar(context: context, message: 'Enter new password!', error: true);
    return false;
  }

  bool checkCode() {
    if (_firstCodeTextController.text.isNotEmpty &&
        _secondCodeTextController.text.isNotEmpty &&
        _thirdCodeTextController.text.isNotEmpty &&
        _fourthCodeTextController.text.isNotEmpty) {
      getVerificationCode();
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter verification code',
      error: true,
    );
    return false;
  }

  String getVerificationCode() {
    return _code = _firstCodeTextController.text +
        _secondCodeTextController.text +
        _thirdCodeTextController.text +
        _fourthCodeTextController.text;
  }

//
  Future<void> resetPassword() async {
    final Map<String, String> resetPasswordDetails = {};
    resetPasswordDetails['mobile'] =
        widget.resetPasswordDetails['phoneNumber']!;
    resetPasswordDetails['code'] = _code!;
    resetPasswordDetails['password'] = _newPasswordTextController.text;
    resetPasswordDetails['password_confirmation'] =
        _newPasswordTextController.text;

    Map authBaseResponse = await UserWebService().resetPassword(
      context,
      resetPasswordDetails: resetPasswordDetails,
    );
    if (authBaseResponse['status']) {
      Navigator.pop(context);
    } else {}
  }

  // Future<void> _showMyDialog() async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         titlePadding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 24.h),
  //         actionsPadding: EdgeInsets.fromLTRB(32.w, 40.h, 32.w, 16.h),
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
  //         title: Text('Are you sure?',
  //             style: LightTextStyles.SFH6(
  //                 textColor: LightColors.darkColor, isLight: false),
  //             textAlign: TextAlign.center),
  //         content: Text(
  //           "You are about to change your password. Please double check it again.",
  //           style: LightTextStyles.SFBody(textColor: LightColors.greyOneColor),
  //           textAlign: TextAlign.center,
  //         ),
  //         actionsAlignment: MainAxisAlignment.center,
  //         actions: <Widget>[
  //           TextButton(
  //             child: Text(
  //               'I AM SURE',
  //               style: LightTextStyles.SFBody(
  //                   textColor: LightColors.darkColor, isLight: false),
  //             ),
  //             onPressed: () {
  //               Navigator.pushReplacementNamed(context, AppRouter.home);
  //             },
  //           ),
  //           TextButton(
  //             child: Text('CANCEL',
  //                 style: LightTextStyles.SFBody(
  //                     textColor: LightColors.greyOneColor)),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  // );
}
// }
