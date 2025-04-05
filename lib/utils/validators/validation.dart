class TValidator {
  static bool validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    // Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }
    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }
    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }
    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]]'))) {
      return 'Password must contain at least special character.';
    }
    return null;
  }

  static bool validatePhoneNumber(String?value) {
    if (value == null || value.isEmpty) {
      return false;
    }


    //Regular expression for phone number validation (assuming a 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{10}');

    if (!phoneRegExp.hasMatch(value)) {
      return false;
    }
    return true;
  }
  //Add more custom validators as needed for your specific requirements
}
