import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TestUtils {

  static bool tapTextSpan(RichText richText, String text) {
    final isTapped = !richText.text.visitChildren(
          (visitor) => _findTextAndTap(visitor, text),
    );
    return isTapped;
  }

  static bool _findTextAndTap(InlineSpan visitor, String text) {
    if (visitor is TextSpan && visitor.text == text) {
      (visitor.recognizer as TapGestureRecognizer).onTap!();
      return false;
    }
    return true;
  }
}