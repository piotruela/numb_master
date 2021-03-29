import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FooterText extends StatelessWidget {
  final String questionText;
  final String clickableText;
  final VoidCallback onTextClicked;

  const FooterText(
      {Key? key,
      required this.questionText,
      required this.clickableText,
      required this.onTextClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: questionText,
          style: TextStyle(fontSize: 18.0, color: Colors.black)),
      TextSpan(
          text: clickableText,
          style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 18.0,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
          recognizer: TapGestureRecognizer()..onTap = onTextClicked),
    ]));
  }
}