import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          minimumSize: MaterialStateProperty.all<Size>(Size(250, 50)),
          backgroundColor:
              MaterialStateProperty.all<Color>(Theme.of(context).buttonColor)),
      onPressed: () => {},
      child: Text(
        'Register',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );
  }
}
/*Theme.of(context).buttonColor*/
