import 'package:flutter/material.dart';

import '../../../core/prefs/shared_pref_controller.dart';
import '../../../data/web_services/user_web_service.dart';
import '../../router/app_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async => await performLogout(),
              icon: Icon(Icons.logout))
        ],
        title: Text("Profile"),
      ),
      body: Center(
          child: Container(
        child: const Text("Profile"),
      )),
    );
  }

  Future<void> performLogout() async {
    Map authBaseResponse = await UserWebService().logout(context);

    if (authBaseResponse['status']) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushNamed(
          context,
          AppRouter.login,
        );
      });
    } else {
      print('error');
    }
  }
}
