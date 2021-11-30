// import 'package:flutter/material.dart';
// import 'package:globe/core/constants/colors.dart';
// import 'package:globe/core/constants/text_styles.dart';
// import 'package:globe/presentation/router/app_router.dart';
// import 'package:globe/presentation/screens/widgets/defualt_button.dart';
// import 'package:globe/presentation/screens/widgets/head_text_with_picture.dart';
// import 'package:globe/presentation/screens/widgets/input_text_field.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ChangePasswordScreen extends StatelessWidget {
//   const ChangePasswordScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SafeArea(
//         child: SizedBox(
//           width: double.infinity,
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 32.w),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   const HeadTextWithPicture(
//                     headText: "Change Password",
//                     imgPath:
//                         "assets/images/LIGHT_ILLUSTRATIONS_ChangePassword.svg",
//                   ),
//                   SizedBox(height: 30.h),
//                   const ChangePasswordForm(),
//                   SizedBox(height: 48.h),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ChangePasswordForm extends StatefulWidget {
//   const ChangePasswordForm({Key? key}) : super(key: key);

//   @override
//   _ChangePasswordFormState createState() => _ChangePasswordFormState();
// }

// class _ChangePasswordFormState extends State<ChangePasswordForm> {
//   late TextEditingController _conformedPasswordTextcontroller;
//   late TextEditingController _passwordTextcontroller;

//   @override
//   void initState() {
//     super.initState();
//     _conformedPasswordTextcontroller = TextEditingController();
//     _passwordTextcontroller = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _conformedPasswordTextcontroller.dispose();
//     _passwordTextcontroller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         InputTextField(
//           controller: _passwordTextcontroller,
//           hintText: "Enter your password",
//           labelText: "Password",
//           suffixIcon: Icons.lock_outline,
//           obscureText: true,
//         ),
//         SizedBox(height: 8.h),
//         InputTextField(
//           controller: _conformedPasswordTextcontroller,
//           hintText: "Conform your password",
//           labelText: "Password",
//           suffixIcon: Icons.lock_outline,
//           obscureText: true,
//         ),
//         SizedBox(height: 158.h),
//         DefaultButton(press: _showMyDialog, text: "Change Password"),
//       ],
//     );
//   }

//   Future<void> _showMyDialog() async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           titlePadding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 24.h),
//           actionsPadding: EdgeInsets.fromLTRB(32.w, 40.h, 32.w, 16.h),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
//           title: Text('Are you sure?',
//               style: LightTextStyles.SFH6(
//                   textColor: LightColors.darkColor, isLight: false),
//               textAlign: TextAlign.center),
//           content: Text(
//             "You are about to change your password. Please double check it again.",
//             style: LightTextStyles.SFBody(textColor: LightColors.greyOneColor),
//             textAlign: TextAlign.center,
//           ),
//           actionsAlignment: MainAxisAlignment.center,
//           actions: <Widget>[
//             TextButton(
//               child: Text(
//                 'I AM SURE',
//                 style: LightTextStyles.SFBody(
//                     textColor: LightColors.darkColor, isLight: false),
//               ),
//               onPressed: () {
//                 Navigator.pushReplacementNamed(context, AppRouter.home);
//               },
//             ),
//             TextButton(
//               child: Text('CANCEL',
//                   style: LightTextStyles.SFBody(
//                       textColor: LightColors.greyOneColor)),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
