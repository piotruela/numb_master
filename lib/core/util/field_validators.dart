import 'package:validators/validators.dart';

class Validators {
  static String? emailValidator(String? value) => _validator(value, isEmail, 'Invalid email');

  static String? passwordValidator(String? value) =>
      _validator(value, (value) => value.length > 7, 'Password is to short');

  static String? repeatPasswordValidator(String? value, String? password) =>
      _validator(value, (value) => value == password, 'Password is not the same');

  static _validator(String? value, bool Function(String) validate, String errorMessage) =>
      (value != null && validate(value)) ? null : errorMessage;
}
