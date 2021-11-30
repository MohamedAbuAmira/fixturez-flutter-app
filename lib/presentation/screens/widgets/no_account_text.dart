import 'package:fixturez/core/constants/constants.dart';
import 'package:fixturez/presentation/router/app_router.dart';
import 'package:flutter/material.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don’t have an account? ",
            style: AppTextStyles.PoppinsBody1(textColor: AppColors.darkColor)),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRouter.signup);
          },
          child: Text(
            "Sign Up",
            style: AppTextStyles.PoppinsBody1(textColor: AppColors.darkColor),
          ),
        ),
      ],
    );
  }
}
