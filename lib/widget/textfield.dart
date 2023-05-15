import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPassword;
  final String hintText;
  final  TextStyle hintStyle;
  final Widget prefixIcon;
  final TextInputType textInputType;
  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    required this.textInputType,
    required this.hintText,
    required this.hintStyle,
    required this.prefixIcon,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
        obscureText: isPassword,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          prefixIcon: prefixIcon,
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          filled: true,
          contentPadding: const EdgeInsets.all(20),
        ));
  }
}
