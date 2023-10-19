import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.validator,
    required this.hintText, this.controller,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final String hintText;
  final TextEditingController ?controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator : validator,
      decoration: InputDecoration(
        filled: true,
        hintStyle: const TextStyle(color: Color(0xFF5B6262)),
        fillColor: const Color(0xFFE8ECF4),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}