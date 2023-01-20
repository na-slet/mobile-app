import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

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
        Container(
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

final List<int> Dates = List<int>.generate(31, (i) => i+1);
class DropdownDateField extends StatefulWidget {
  DropdownDateField({super.key});

  @override
  State<DropdownDateField> createState() => _DropdownDateFieldState();
}

class _DropdownDateFieldState extends State<DropdownDateField> {

  String dropdownValue = Dates[0].toString();

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: Dates.map<DropdownMenuItem<String>>((int value) {
        return DropdownMenuItem<String>(
          value: value.toString(),
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }
}
final List<int> Months = List<int>.generate(31, (i) => i+1);
class DropdownMonthField extends StatefulWidget {
  DropdownMonthField({super.key});

  @override
  State<DropdownMonthField> createState() => _DropdownMonthFieldState();
}

class _DropdownMonthFieldState extends State<DropdownMonthField> {

  String dropdownValue = Dates[0].toString();

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: Dates.map<DropdownMenuItem<String>>((int value) {
        return DropdownMenuItem<String>(
          value: value.toString(),
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }
}

