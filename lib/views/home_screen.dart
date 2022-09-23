import 'package:flutter/material.dart';
import 'package:flutter_fingerprint_authentication/views/splash_screen.dart';
import 'package:flutter_fingerprint_authentication/widgets/app_button.dart';

import '../Controllers/authentication_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AppButton(
            buttonText: 'Logout',
            onPressed: () async {
              await AuthenticationController().logoutUser();
              if (!mounted) return;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SplashScreen(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
