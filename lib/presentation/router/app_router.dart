import 'package:fixturez/core/exceptions/route_exception.dart';
import 'package:fixturez/presentation/screens/home_page.dart';
import 'package:fixturez/presentation/screens/intro/login_screen.dart';
import 'package:fixturez/presentation/screens/intro/luanch_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String launch = 'launch_screen';
  static const String login = '/login_screen';
  static const String forgotPassword = '/forgot_password_screen';
  static const String signup = '/signup_screen';
  static const String home = '/';

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
      // case forgotPassword:
      //   return MaterialPageRoute(
      //     builder: (_) => const ForgotPasswordScreen(),
      //   );
      // case signup:
      //   return MaterialPageRoute(
      //     builder: (_) => const SignUpScreen(),
      //   );
      case home:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
