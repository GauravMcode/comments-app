import 'package:comments_app/common/utilities/utilities.dart';
import 'package:comments_app/config/page_routes.dart';
import 'package:comments_app/features/authentication/model/auth_req.dart';
import 'package:comments_app/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  bool loading = false;
  final authRepository = AuthRepository();

  signUp(AuthReq req, BuildContext context) async {
    loading = true;
    notifyListeners();
    final String message = await authRepository.signUp(req);
    showToast(message);
    if (message.toLowerCase().contains("success")) {
      Navigator.of(context).pushReplacementNamed(PageRoutes.home);
    }
    loading = false;
    notifyListeners();
  }

  logIn(AuthReq req, BuildContext context) async {
    loading = true;
    notifyListeners();
    final String message = await authRepository.logIn(req);
    showToast(message);
    if (message.toLowerCase().contains("success")) {
      Navigator.of(context).pushReplacementNamed(PageRoutes.home);
    }
    loading = false;
    notifyListeners();
  }

}
