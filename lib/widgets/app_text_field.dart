import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.keyboardType = TextInputType.text, required this.validator,
  });

  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType keyboardType;
    final String? Function(String?) validator;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // =======================================================================
      // Text Editing Controller
      // =======================================================================
      controller: textEditingController,
      // =======================================================================
      // Keyboard type
      // =======================================================================
      keyboardType: keyboardType,
      // =======================================================================
      // Validator
      // =======================================================================
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // =======================================================================
      // Text Field Styling
      // =======================================================================
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
        filled: true,
        fillColor: Colors.white,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
      ),
    );
  }
}
