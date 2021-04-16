import 'package:flutter/material.dart';

class AppSnackBar extends SnackBar {
  final String? label;

  AppSnackBar({this.label})
      : super(
      content: Text(label??'Error!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating,
      elevation: 6.0);
}