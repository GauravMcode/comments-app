import 'package:comments_app/common/utilities/utilities.dart';
import 'package:comments_app/features/authentication/model/auth_req.dart';
import 'package:comments_app/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  bool loading = false;
  final authRepository = AuthRepository();

  signUp(AuthReq req) async {
    loading = true;
    notifyListeners();
    final String message = await authRepository.signUp(req);
    showToast(message);
    loading = false;
    notifyListeners();
  }

  logIn(AuthReq req) async {
    loading = true;
    notifyListeners();
    final String message = await authRepository.logIn(req);
    showToast(message);
    loading = false;
    notifyListeners();
  }
}
