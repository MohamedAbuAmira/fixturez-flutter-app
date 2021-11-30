// import 'package:flutter/material.dart';
// import 'package:globe/core/prefs/shared_pref_controller.dart';
// import 'package:globe/presentation/router/app_router.dart';
// import 'package:globe/presentation/screens/widgets/defualt_button.dart';
// import 'package:globe/presentation/screens/widgets/input_text_field.dart';
// import 'package:globe/presentation/screens/widgets/head_text_with_picture.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({Key? key}) : super(key: key);
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
//                     headText: "Sign Up",
//                     imgPath: "assets/images/LIGHT_ILLUSTRATIONS_SeatWindow.svg",
//                   ),
//                   SizedBox(height: 20.h),
//                   const SignUpForm(),
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

// class SignUpForm extends StatefulWidget {
//   const SignUpForm({Key? key}) : super(key: key);

//   @override
//   _SignUpFormState createState() => _SignUpFormState();
// }

// class _SignUpFormState extends State<SignUpForm> {
//   late TextEditingController _emailTextcontroller;
//   late TextEditingController _passwordTextcontroller;
//   late TextEditingController _conformedPasswordTextcontroller;
//   late TextEditingController _nameTextcontroller;

//   @override
//   void initState() {
//     super.initState();
//     _emailTextcontroller = TextEditingController();
//     _passwordTextcontroller = TextEditingController();
//     _conformedPasswordTextcontroller = TextEditingController();
//     _nameTextcontroller = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _emailTextcontroller.dispose();
//     _passwordTextcontroller.dispose();
//     _conformedPasswordTextcontroller.dispose();
//     _nameTextcontroller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         InputTextField(
//           controller: _nameTextcontroller,
//           hintText: "Enter your name",
//           labelText: "Name",
//           suffixIcon: Icons.person_outline,
//           textInputType: TextInputType.name,
//         ),
//         SizedBox(height: 8.h),
//         InputTextField(
//           controller: _emailTextcontroller,
//           hintText: "Enter your email",
//           labelText: "Email",
//           suffixIcon: Icons.mail_outline,
//           textInputType: TextInputType.emailAddress,
//         ),
//         SizedBox(height: 8.h),
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
//         SizedBox(
//           height: 40.h,
//         ),
//         DefaultButton(press: performLogin, text: "Sign Up"),
//       ],
//     );
//   }

//   void performLogin() {
//     if (chechData()) {
//       return login();
//     }
//   }

//   bool chechData() {
//     if (_emailTextcontroller.text.isNotEmpty &&
//         _passwordTextcontroller.text.isNotEmpty &&
//         _nameTextcontroller.text.isNotEmpty &&
//         _conformedPasswordTextcontroller.text.isNotEmpty) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   void login() async {
//     await SharedPrefController().save(email: _emailTextcontroller.text);
//     await SharedPrefController().saveName(name: _nameTextcontroller.text);
//     Future.delayed(const Duration(seconds: 1), () {
//       Navigator.pushReplacementNamed(context, AppRouter.home);
//     });
//   }
// }
