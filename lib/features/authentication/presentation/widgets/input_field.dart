import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const InputField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          alignLabelWithHint: false,
          focusedBorder: _buildBorderStyle(context, Theme.of(context).primaryColor),
          enabledBorder: _buildBorderStyle(context, Theme.of(context).unselectedWidgetColor),
          errorBorder: _buildBorderStyle(context, Theme.of(context).errorColor),
          focusedErrorBorder: _buildBorderStyle(context, Theme.of(context).errorColor),
        ),
      ),
    );
  }

  OutlineInputBorder _buildBorderStyle(BuildContext context, Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        width: 2.0,
        color: color,
      ),
    );
  }
}
