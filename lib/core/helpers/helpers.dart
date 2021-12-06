import 'package:fixturez/core/constants/constants.dart';
import 'package:flutter/material.dart';

mixin Helpers {
  void showSnackBar({
    required BuildContext context,
    required String message,
    bool error = false,
    bool hideAction = false,
    int durationInSeconds = 2,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message),
          backgroundColor: error ? Colors.red : Colors.green,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: durationInSeconds),
          action: hideAction
              ? SnackBarAction(
                  label: 'Hide',
                  textColor: AppColors.darkColor,
                  onPressed: () {
                    // Some code to undo the change.
                  },
                )
              : null),
    );
  }
}
