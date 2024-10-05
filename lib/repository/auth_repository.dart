import 'package:comments_app/features/authentication/model/auth_req.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class AuthRepository {
  final logger = Logger();
  final _auth = FirebaseAuth.instance;

  static bool checkLoginState() {
    return FirebaseAuth.instance.currentUser != null;
  }

  Future<String> signUp(AuthReq req) async {
    try {
      final data = await _auth.createUserWithEmailAndPassword(
          email: req.email, password: req.password);
      await data.user?.updateDisplayName(req.name);
      return "Registration successful!";
    } on FirebaseAuthException catch (e) {
      logger.e(e);
      switch (e.code) {
        case 'weak-password':
          return 'The password provided is too weak.';
        case 'email-already-in-use':
          return 'The account already exists for that email.';
        case 'invalid-email':
          return 'The email address is invalid.';
        default:
          return 'An error occurred: ${e.message}';
      }
    } catch (e) {
      logger.e(e);
      return 'An unknown error occurred: $e';
    }
  }

  Future<String> logIn(AuthReq req) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: req.email,
        password: req.password,
      );
      return "Sign in successful!";
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return 'No user found for that email.';
        case 'wrong-password':
          return 'Wrong password provided for that user.';
        case 'invalid-email':
          return 'The email address is not valid.';
        case 'user-disabled':
          return 'The user account has been disabled.';
        case 'too-many-requests':
          return 'Too many requests. Please try again later.';
        default:
          return 'An undefined error occurred: ${e.message}';
      }
    } catch (e) {
      return 'An unknown error occurred: $e';
    }
  }
}
