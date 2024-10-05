import 'package:comments_app/common/widgets/error_page.dart';
import 'package:comments_app/config/page_routes.dart';
import 'package:comments_app/features/authentication/view/login_page.dart';
import 'package:comments_app/features/authentication/view/signup_page.dart';
import 'package:comments_app/features/home/view/ui/home_page.dart';
import 'package:comments_app/features/home/view/ui/profile_page.dart';
import 'package:flutter/material.dart';

class Navigation {
  static Route<String> onGenerateRoutes(RouteSettings settings) {
    // final arguments = settings.arguments;

    switch (settings.name) {
      case PageRoutes.signUp:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SignUpPage(),
        );
      case PageRoutes.login:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const LoginPage(),
        );
      case PageRoutes.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomePage(),
        );
      case PageRoutes.profile:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ProfilePage(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ErrorPage(),
        );
    }
  }
}
