import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String buttonLabel;
  final VoidCallback? onPressed;

  const SubmitButton({
    Key? key,
    required this.buttonLabel,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(const Size(250, 50)),
        backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).buttonColor),
      ),
      onPressed: onPressed,
      child: Text(
        buttonLabel,
        style: const TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );
  }
}
