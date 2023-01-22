import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../generated/l10n.dart';
import '../services/ColorService.dart';

typedef VoidCallbackString = String? Function(String?);

class PrimaryTextField extends StatelessWidget {
  final colorService = Injector().get<ColorService>();

  final bool autofocus;
  final bool obscureText;
  final bool readonly;
  final String labelText;
  final TextStyle labelStyle;
  final TextInputType textInputType;
  final VoidCallbackString validator;

  final TextEditingController controller;

  PrimaryTextField({
    Key? key,
    this.autofocus = false,
    this.obscureText = false,
    this.readonly = false,
    this.textInputType = TextInputType.text,
    required this.controller,
    required this.labelText,
    required this.labelStyle,
    required this.validator,
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
      validator: validator,
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

class ProfilePageTextField extends StatelessWidget {
  final ColorService colorService = Injector().get<ColorService>();

  final double height;
  final bool autofocus;
  final bool obscureText;
  final bool readonly;
  final String hintText;
  final String lableText;
  final TextInputType textInputType;

  final TextEditingController controller;

  ProfilePageTextField({
    Key? key,
    this.autofocus = false,
    this.obscureText = false,
    this.readonly = false,
    this.textInputType = TextInputType.text,
    required this.controller,
    required this.hintText,
    required this.lableText,
    this.height = 35,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          lableText,
          style: TextStyle(
            color: colorService.profilePageTexFieldHintColor(),
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: height,
          child: TextFormField(
            keyboardType: textInputType,
            autofocus: autofocus,
            readOnly: readonly,
            cursorColor: colorService.primaryColor(),
            controller: controller,
            obscureText: obscureText,
            // validator: validator,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: colorService.primaryColor(), width: 1.5),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: colorService.primaryColor(), width: 1.5),
                borderRadius: BorderRadius.circular(5),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: colorService.profilePageTexFieldHintColor(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdownField extends StatefulWidget {
  final double buttonWidth;
  final double buttonHeight;
  final List<String> items;
  final AlignmentGeometry hintAlignment;
  final EdgeInsetsGeometry hintPadding;
  final Color textColor;

  const DropdownField(
      {super.key,
      required this.buttonWidth,
      required this.buttonHeight,
      required this.items,
      this.hintAlignment = Alignment.centerLeft,
      this.hintPadding = EdgeInsets.zero,
      required this.textColor});

  @override
  State<DropdownField> createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  final colorService = Injector().get<ColorService>();

  String? selectedValue;
  late List<String> items = widget.items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: colorService.primaryColor()),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton2(
        isExpanded: true,
        buttonHeight: widget.buttonHeight,
        buttonWidth: widget.buttonWidth,
        underline: Container(color: Colors.transparent),
        hint: Container(
          padding: widget.hintPadding,
          alignment: widget.hintAlignment,
          child: Text(
            items[0],
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: widget.textColor),
          ),
        ),
        items: (items
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: Container(
                  alignment: widget.hintAlignment,
                  child: Padding(
                    padding: widget.hintPadding,
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: colorService.signInScreenTitleColor(),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList()),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
          });
        },
      ),
    );
  }
}
