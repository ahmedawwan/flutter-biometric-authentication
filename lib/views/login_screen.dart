import 'package:flutter/material.dart';
import 'package:flutter_fingerprint_authentication/Controllers/authentication_controller.dart';
import 'package:flutter_fingerprint_authentication/utilities/validators.dart';
import 'package:flutter_fingerprint_authentication/views/home_screen.dart';
import 'package:flutter_fingerprint_authentication/views/register_screen.dart';
import 'package:flutter_fingerprint_authentication/widgets/app_button.dart';
import 'package:flutter_fingerprint_authentication/widgets/app_text_field.dart';
import 'package:flutter_fingerprint_authentication/widgets/password_text_field.dart';
import 'package:flutter_fingerprint_authentication/widgets/touch_id_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ===========================================================================
  // Text Editing Controllers
  // ===========================================================================
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // ===========================================================================
  // Form key
  // ===========================================================================
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // ===========================================================================
  // Login User method
  // ===========================================================================
  loginUser() async {
    AuthenticationController authController = AuthenticationController();
    bool isloggedIn = await authController.loginUser(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
    if (!mounted) return;
    if (isloggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // =======================================================================
      // Form
      // =======================================================================
      body: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Form(
          key: loginFormKey,
          child: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              // ===============================================================
              // Welcome Text
              // ===============================================================
              const Text(
                'Biometric Authentication',
                style: TextStyle(
                  color: Color(0xff303450),
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              // ===============================================================
              // Sign in text
              // ===============================================================
              const Text(
                'Login now',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              // ===============================================================
              // Don't have an account
              // ===============================================================
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ),
                  ),
                  child: const Text(
                    'Don\'t have an account? Click here',
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // =================================================================
              // Email Text Field
              // =================================================================
              AppTextField(
                textEditingController: emailController,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (email) => emailValidation(email),
              ),
              const SizedBox(
                height: 16,
              ),
              // =================================================================
              // Password Text Field
              // =================================================================
              PasswordTextField(
                textEditingController: passwordController,
                validator: (password) => passwordValidation(password),
              ),
              const SizedBox(
                height: 24,
              ),
              // =================================================================
              // Sign in Button
              // =================================================================
              AppButton(
                buttonText: "Sign in",
                onPressed: loginUser,
              ),
              const SizedBox(
                height: 40,
              ),
              // ===============================================================
              // Login with touch id button
              // ===============================================================
              const TouchIDButton(),
            ],
          ),
        ),
      ),
    );
  }
}
