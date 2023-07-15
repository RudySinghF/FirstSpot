import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class signupWithPhoneExceptions {
  final String message;

  const signupWithPhoneExceptions(
      [this.message = "An Unknown error occurred."]);

  factory signupWithPhoneExceptions.code(String code) {
    switch (code) {
      case 'invalid-number':
        return const signupWithPhoneExceptions('Phone entered is invalid');
      case 'number-already-in-use':
        return const signupWithPhoneExceptions(
            'Number entered is already been registered');
      case 'operation-not-allowed':
        return const signupWithPhoneExceptions(
            'Operation is not allowed. Please contact support');
      case 'user-disabled':
        return const signupWithPhoneExceptions(
            'This user is disabled. Please contact support');
      default:
        return const signupWithPhoneExceptions();
    }
  }
}

class signInWithPhoneExceptions {
  final String message;
  const signInWithPhoneExceptions(
      [this.message = "An Unknown error occurred."]);
  factory signInWithPhoneExceptions.code(String code) {
    switch (code) {
      case 'User-not-found':
        return const signInWithPhoneExceptions(
            'You have not registered. Please Sign up');
      case 'invalid-number':
        return const signInWithPhoneExceptions('Phone entered is invalid');
      case 'user-disabled':
        return const signInWithPhoneExceptions(
            'This user is disabled. Please contact support');
      default:
        return const signInWithPhoneExceptions();
    }
  }
}
