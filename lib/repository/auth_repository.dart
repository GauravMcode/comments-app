import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comments_app/common/utilities/utilities.dart';
import 'package:comments_app/features/authentication/model/auth_req.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class AuthRepository {
  final logger = Logger();
  final _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  static bool checkLoginState() {
    return FirebaseAuth.instance.currentUser != null;
  }

  Future<String> signUp(AuthReq req) async {
    try {
      final data = await _auth.createUserWithEmailAndPassword(
          email: req.email, password: req.password);
      await data.user?.updateDisplayName(req.name);
      await saveUserData(req);
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

  saveUserData(AuthReq req) async {
    try {
      await users.add({'name': req.name, 'email': req.email});
    } on FirebaseException catch (e) {
      String message;

      switch (e.code) {
        case 'permission-denied':
          message = 'You do not have permission to perform this operation.';
          break;
        case 'unavailable':
          message =
              'The service is currently unavailable. Please try again later.';
          break;
        case 'unknown':
        default:
          message = 'An unknown error occurred. Please try again.';
      }
      showToast(message);
      rethrow;
    } catch (e) {
      logger.e(e);
      rethrow;
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

  static logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static User? getUserDetails() {
    return FirebaseAuth.instance.currentUser;
  }
}
