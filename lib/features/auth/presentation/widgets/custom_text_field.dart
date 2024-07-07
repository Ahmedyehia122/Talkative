import 'package:flutter/material.dart';

import 'package:chat_app/core/constants/styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.keyboardType,
    required this.obscureText,
    this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyles.whiteFont,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(3),
    borderSide: const BorderSide(
      color: Colors.white,
    ),
  );
}
