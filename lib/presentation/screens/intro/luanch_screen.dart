import 'package:fixturez/core/prefs/shared_pref_controller.dart';
import 'package:fixturez/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      String ruote =
          SharedPrefController().loggedIn ? AppRouter.home : AppRouter.login;
      Navigator.pushReplacementNamed(context, ruote);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 80.0),
        alignment: Alignment.center,
        child: SvgPicture.asset('assets/images/logo.svg'),
      ),
    );
  }
}
