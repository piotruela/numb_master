import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get themeData {
    return ThemeData(
      primaryColor: Color(0xFF747FE8),
      buttonColor: Color(0xFFFDDC77),
      errorColor: Color(0xFFAD1616),
      unselectedWidgetColor: Color(0xFFBDBDBD),
      fontFamily: 'Roboto',
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(100, 40)),
          shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(90.0),
              side: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
