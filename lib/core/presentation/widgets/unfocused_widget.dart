import 'package:flutter/material.dart';

class UnfocusedWidget extends StatelessWidget {
  final Widget child;

  const UnfocusedWidget({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
