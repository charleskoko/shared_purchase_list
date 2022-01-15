import 'package:flutter/material.dart';

class Validator {
  static String? emailValidator(String email) {
    if (email.isNotEmpty) {
      bool isMatched = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      return isMatched ? null : 'Please, enter a valid email address';
    } else {
      return 'Email field is required';
    }
  }

  static String? passwordValidator(String password) {
    if (password.isNotEmpty) {
      bool isMatched = RegExp(
              r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$")
          .hasMatch(password);
      return isMatched ? null : 'Please, enter a valid password';
    } else {
      return 'Password field is required';
    }
  }

  static String? textValidator(String text, {required label}) {
    if (text.isEmpty || text == null) {
      return '$label is required';
    } else {
      return null;
    }
  }
}
