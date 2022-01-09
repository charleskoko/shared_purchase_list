import 'package:flutter/src/widgets/framework.dart';

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

  static String? displayNameValidator(String username) {
    if (username.isNotEmpty) {
      bool isMatched =
          RegExp(r"^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$")
              .hasMatch(username);
      return isMatched ? null : 'Please, enter a valid user name';
    } else {
      return ' is required';
    }
  }

  static String? textValidator(String text, {required label}) {
    if (text.isEmpty || text == null) {
      return '$label is required';
    } else {
      return null;
    }
  }

  static String? passwordConfirmation(
      String value, String? passwordConfirmation) {
    if (value.isEmpty || passwordConfirmation == null) {
      return 'Confrimation is required';
    } else {
      if (value == passwordConfirmation) {
        return null;
      } else {
        return 'The passwords do not match';
      }
    }
  }
}
