import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomEdit extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool isPassword;

  final FormFieldValidator<String> validator;

  const CustomEdit({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.validator,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            const TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
