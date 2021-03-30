import 'package:flutter/material.dart';

class TextEditingField extends StatelessWidget {
  const TextEditingField({
    Key key,
    @required TextEditingController passwordContoller,
    this.fieldStyle,
    this.obscureText = false,
    this.radius = 7.0,
    this.hintText,
    this.labelText,
    this.hintStyle = const TextStyle(
      fontSize: 16,
    ),
  })  : _passwordContoller = passwordContoller,
        super(key: key);

  final TextEditingController _passwordContoller;
  final TextStyle fieldStyle;
  final bool obscureText;
  final double radius;

  final String hintText;
  final String labelText;
  final TextStyle hintStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: _passwordContoller,
      style: fieldStyle,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        labelText: labelText,
        hintText: hintText,
        hintStyle: hintStyle,
      ),
    );
  }
}
