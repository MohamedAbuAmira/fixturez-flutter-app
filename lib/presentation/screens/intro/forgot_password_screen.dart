// import 'package:flutter/material.dart';
// import 'package:globe/core/constants/colors.dart';
// import 'package:globe/core/constants/text_styles.dart';
// import 'package:globe/presentation/router/app_router.dart';
// import 'package:globe/presentation/screens/widgets/defualt_button.dart';
// import 'package:globe/presentation/screens/widgets/head_text_with_picture.dart';
// import 'package:globe/presentation/screens/widgets/input_text_field.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ForgotPasswordScreen extends StatelessWidget {
//   const ForgotPasswordScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: SafeArea(
//           child: SizedBox(
//             width: double.infinity,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 32.w),
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const HeadTextWithPicture(
//                       headText: "Forgot Password",
//                       imgPath:
//                           "assets/images/LIGHT_ILLUSTRATIONS_ForgotPassword.svg",
//                     ),
//                     SizedBox(height: 30.h),
//                     const ForgotPassForm(),
//                     SizedBox(height: 48.h),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }
// }

// class ForgotPassForm extends StatefulWidget {
//   const ForgotPassForm({Key? key}) : super(key: key);

//   @override
//   _ForgotPassFormState createState() => _ForgotPassFormState();
// }

// class _ForgotPassFormState extends State<ForgotPassForm> {
//   late TextEditingController _emailTextcontroller;
//   @override
//   void initState() {
//     super.initState();
//     _emailTextcontroller = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _emailTextcontroller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         InputTextField(
//           controller: _emailTextcontroller,
//           hintText: "Enter your email",
//           labelText: "Email",
//           suffixIcon: Icons.mail_outline,
//           textInputType: TextInputType.emailAddress,
//         ),
//         SizedBox(height: 40.h),
//         TextButton(
//             onPressed: () {},
//             child: Text("Resend email",
//                 style: LightTextStyles.SFBody(
//                   textColor: LightColors.darkColor,
//                 ))),
//         SizedBox(height: 166.h),
//         DefaultButton(
//           text: "Send new password",
//           press: () {
//             {
//               Navigator.pushNamed(context, AppRouter.changePassword);
//             }
//           },
//         ),
//       ],
//     );
//   }
// }
