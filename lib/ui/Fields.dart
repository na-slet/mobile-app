import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../services/ColorService.dart';

class PrimaryTextField extends StatelessWidget {
  final colorService = Injector().get<ColorService>();

  final bool obscureText;
  final String labelText;
  final TextStyle labelStyle;

  final TextEditingController controller;

  PrimaryTextField({
    Key? key,
    this.obscureText = false,
    required this.labelText,
    required this.labelStyle,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: colorService.primaryColor(),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorService.primaryColor(), width: 2),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorService.primaryColor(), width: 2),
        ),
      ),
    );
  }
}