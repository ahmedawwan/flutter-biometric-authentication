import 'package:flutter/material.dart';
import 'package:flutter_fingerprint_authentication/utilities/validators.dart';
import 'package:flutter_fingerprint_authentication/widgets/app_button.dart';
import 'package:flutter_fingerprint_authentication/widgets/app_text_field.dart';
import 'package:flutter_fingerprint_authentication/widgets/password_text_field.dart';
import 'package:flutter_fingerprint_authentication/widgets/touch_id_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // ===========================================================================
  // Text Editing controllers
  // ===========================================================================
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // ===========================================================================
  // Form Key
  // ===========================================================================
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

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
              // Sign in text
              // ===============================================================
              const Text(
                'Sign in now',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 32,
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
                onPressed: () {},
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
