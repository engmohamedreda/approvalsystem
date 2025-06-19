import 'package:flutter/material.dart';


class Validators {
  static String? validateName(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {

    }
    return null;
  }

  static String? validatePhone(BuildContext context, String? value) {

  }

  static String? validateNumber(BuildContext context, String? value) {

  }

  static String? validateText(BuildContext context, String? value) {

  }

  static String? validateEmail(BuildContext context, String? value) {
    const pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,64}$";
    final regex = RegExp(pattern);

  }

  static String? validatePassword(BuildContext context, String? value) {
    String errorMessage = '';

    return errorMessage.isEmpty ? null : errorMessage;
  }

  static String? validatePin(BuildContext context, String? value) {

  }
}