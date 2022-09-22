Pattern emailPattern = "[a-zA-Z0-9._-]+@[a-z]+\\.+[a-z]+";
// =============================================================================
// Email Validation Validator
// =============================================================================
String? emailValidation(String? email) {
  RegExp regex = RegExp(emailPattern.toString());
  if (email!.isEmpty) {
    return "Email field is required";
  } else if (!regex.hasMatch(email)) {
    return "enter a valid email";
  } else {
    return null;
  }
}

// =============================================================================
// Password Validation (must be of at least 8 characters)
// =============================================================================

String? passwordValidation(String? password) {
  if (password!.isEmpty) {
    return 'Please enter a password';
  } else {
    if (password.length < 8) {
      return 'Password must be of at least 8 characters';
    } else {
      return null;
    }
  }
}

// =============================================================================
// Confirm password validation
// =============================================================================
String? confirmPasswordValidation(String? password, String? confirmPassword) {
  if (confirmPassword!.isNotEmpty) {
    if (password != confirmPassword) {
      return 'Passwords do not match';
    } else {
      return null;
    }
  } else {
    return 'Please enter a password';
  }
}

// =============================================================================
// Validator for field not empty
// =============================================================================
String? isEmptyValidation(String? name) {
  if (name!.isEmpty) {
    return "This field is required";
  } else {
    return null;
  }
}