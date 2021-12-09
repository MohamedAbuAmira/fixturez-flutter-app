import 'package:fixturez/core/exceptions/route_exception.dart';

import 'package:flutter/material.dart';

import '../../data/models/models.dart';
import '../screens/screens.dart';

class AppRouter {
  static const String launch = 'launch_screen';
  static const String login = '/login_screen';
  static const String forgotPassword = '/forgot_password_screen';
  static const String resetPassword = '/reset_password';
  static const String signup = '/signup_screen';
  static const String activateAccount = '/activate_account';
  static const String home = '/';
  static const String productsInCategoryPage = 'products_in_category';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case launch:
        return MaterialPageRoute(
          builder: (_) => const LaunchScreen(),
        );
      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
      case resetPassword:
        final argResetPasswordDetails =
            settings.arguments as Map<String, String>;
        return MaterialPageRoute(
          builder: (_) => ResetPasswordScreen(
            resetPasswordDetails: argResetPasswordDetails,
          ),
        );
      case signup:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case activateAccount:
        final argsActivateAccountDetails =
            settings.arguments as Map<String, String>;

        return MaterialPageRoute(
          builder: (_) => ActivateAccountScreen(
            activateAccountDetails: argsActivateAccountDetails,
          ),
        );
      case home:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case productsInCategoryPage:
        final argCategory = settings.arguments as Category;
        return MaterialPageRoute(
          builder: (_) => ProductsInCategory(
            category: argCategory,
          ),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
