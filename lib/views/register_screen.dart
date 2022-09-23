import 'package:flutter/material.dart';

import '../utilities/validators.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';
import '../widgets/password_text_field.dart';
import '../widgets/touch_id_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  // ===========================================================================
  // Text Editing controllers
  // ===========================================================================
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // ===========================================================================
  // Form Key
  // ===========================================================================
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

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
          key: registerFormKey,
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
                'Register now',
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
              // Already have an account
              // ===============================================================
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Already have an account? Sign in'),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // ===============================================================
              // Name text field
              // ===============================================================
              AppTextField(
                textEditingController: nameController,
                hintText: 'Name',
                validator: (name) => isEmptyValidation(name),
              ),
              const SizedBox(
                height: 16,
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
                height: 16,
              ),
              // =================================================================
              // Confirm Password Text Field
              // =================================================================
              PasswordTextField(
                textEditingController: confirmPasswordController,
                hintText: 'Confirm Password',
                validator: (confirmPassword) => confirmPasswordValidation(
                  passwordController.text.trim(),
                  confirmPassword,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              // =================================================================
              // Sign in Button
              // =================================================================
              AppButton(
                buttonText: "Register",
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
