class TValidator {
  static bool isValidateEmail(String? value) {
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
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'الإيميل مطلوب';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'الإيميل غير صحيح';
    }
    return null;
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

  static bool isValidatePhoneNumber(String?value) {
    if (value == null || value.isEmpty) {
      return false;
    }


    //Regular expression for phone number validation (assuming a 6-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{6}');

    if (!phoneRegExp.hasMatch(value)) {
      return false;
    }
    return true;
  }
  static String? validatePhoneNumber(String?value) {
    if (value == null || value.isEmpty) {
      return 'الرقم مطلوب';
    }


    //Regular expression for phone number validation (assuming a 6-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{6}');

    if (!phoneRegExp.hasMatch(value)) {
      return 'رقم الهاتف على الأقل يجب أن يكون مكوّن من 6 أرقام';
    }
    return null;
  }

  static bool isValidateName(String?value) {
    if (value == null || value.isEmpty) {
      return false;
    }


    if (value.length<3) {
      return false;
    }
    return true;
  }
  static String? validateName(String?value) {
    if (value == null || value.isEmpty) {
      return 'الاسم مطلوب';
    }


    //Regular expression for phone number validation (assuming a 10-digit US phone number format)


    if (value.length<3) {
      return 'الاسم قصير جدا';
    }
    return null;
  }
  //Add more custom validators as needed for your specific requirements
}
