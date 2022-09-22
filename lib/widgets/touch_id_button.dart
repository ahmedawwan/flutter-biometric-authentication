import 'package:flutter/material.dart';

class TouchIDButton extends StatelessWidget {
  const TouchIDButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: 'logo',
            child: Image.asset(
              'images/touch_ID.png',
              height: 40,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Text(
            "Login with ",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          const Text(
            "Touch ID",
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
