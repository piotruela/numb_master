import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FooterText extends StatelessWidget {
  final String questionText;
  final String clickableText;
  final VoidCallback onTextClicked;

  const FooterText({
    required this.questionText,
    required this.clickableText,
    required this.onTextClicked,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: questionText,
            style: const TextStyle(fontSize: 18.0, color: Colors.black),
          ),
          _buildClickableText(context),
        ],
      ),
    );
  }

  TextSpan _buildClickableText(BuildContext context) {
    return TextSpan(
      text: clickableText,
      style: TextStyle(
        decoration: TextDecoration.underline,
        fontSize: 18.0,
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
      ),
      recognizer: TapGestureRecognizer()..onTap = onTextClicked,
    );
  }
}
