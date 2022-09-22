import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.buttonText,
    required this.onPressed,
    this.borderColor = Colors.white,
    super.key,
  });

  final String buttonText;
  final Function onPressed;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // =======================================================================
      // On pressed function
      // =======================================================================
      onTap: () => onPressed(),
      child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        // =====================================================================
        // Button Style
        // =====================================================================
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(26),
          border: Border.all(width: 1.5, color: borderColor),
        ),
        // =====================================================================
        // Button Text
        // =====================================================================
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
