import 'package:comments_app/common/widgets/error_page.dart';
import 'package:comments_app/features/authentication/view/login_page.dart';
import 'package:comments_app/features/authentication/view/signup_page.dart';
import 'package:comments_app/features/home_page/view/ui/home_page.dart';
import 'package:flutter/material.dart';

class Navigation {
  static Route<String> onGenerateRoutes(RouteSettings settings) {
    // final arguments = settings.arguments;

    switch (settings.name) {
      case "sign-up":
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SignUpPage(),
        );
      case "login":
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const LoginPage(),
        );
      case "home":
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomePage(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ErrorPage(),
        );
    }
  }
}
