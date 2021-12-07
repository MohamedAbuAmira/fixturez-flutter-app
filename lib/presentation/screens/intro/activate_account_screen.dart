import '../../../core/helpers/helpers.dart';
import '../../../data/web_services/user_web_service.dart';
import '../../../presentation/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/constants.dart';
import '../../router/app_router.dart';

class ActivateAccountScreen extends StatefulWidget {
  const ActivateAccountScreen({Key? key, required this.activateAccountDetails})
      : super(key: key);
  final Map<String, String> activateAccountDetails;

  @override
  State<ActivateAccountScreen> createState() => _ActivateAccountScreenState();
}

class _ActivateAccountScreenState extends State<ActivateAccountScreen>
    with Helpers {
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
                    resetPasswordCodeInputFeilds(),
                    SizedBox(
                      height: 20.h,
                    ),
                    DefaultButton(
                        press: () {
                          showSnackBar(
                              context: context,
                              message:
                                  "Your Activation code is ${widget.activateAccountDetails['code']}",
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

  Future<void> performActivation() async {
    if (checkCode()) {
      await activation();
    }
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

  Future<void> activation() async {
    final Map<String, String> activateDetails = {};
    activateDetails['mobile'] = widget.activateAccountDetails['phoneNumber']!;
    activateDetails['code'] = _code!;
    Map authBaseResponse = await UserWebService()
        .activate(context, activateDetails: activateDetails);

    if (authBaseResponse['status']) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(
          context,
          AppRouter.login,
        );
      });
    } else {}
  }
}
