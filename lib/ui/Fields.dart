import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../services/ColorService.dart';

class PrimaryTextField extends StatelessWidget {
  final colorService = Injector().get<ColorService>();

  final bool autofocus;
  final bool obscureText;
  final bool readonly;
  final String labelText;
  final TextStyle labelStyle;
  final TextInputType textInputType;

  final TextEditingController controller;

  PrimaryTextField({
    Key? key,
    this.autofocus = false,
    this.obscureText = false,
    this.readonly = false,
    required this.controller,
    required this.labelText,
    required this.labelStyle,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      autofocus: autofocus,
      readOnly: readonly,
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
