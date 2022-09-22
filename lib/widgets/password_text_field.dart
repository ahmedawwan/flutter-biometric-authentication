import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    required this.textEditingController,
    this.hintText = 'Password',
    required this.validator,
    super.key,
  });

  final TextEditingController textEditingController;
  final String hintText;
  final String? Function(String?) validator;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool showPassword = false; //this variable will be used to show/hide the text
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      cursorColor: Colors.white,
      // =======================================================================
      // Show password
      // =======================================================================
      obscureText: !showPassword,
      // =======================================================================
      // Validator function
      // =======================================================================
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // =======================================================================
      // InputDecoration
      // =======================================================================
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
        filled: true,
        fillColor: const Color(0x30ffffff),
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
        hintText: widget.hintText,
        // =====================================================================
        // in SuffixIcon we pass an IconButton on which we can implement the show/hide password
        // =====================================================================
        suffixIcon: IconButton(
          icon: Icon(
            !showPassword ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
          onPressed: () => setState(() => showPassword = !showPassword),
        ),
      ),
    );
  }
}
