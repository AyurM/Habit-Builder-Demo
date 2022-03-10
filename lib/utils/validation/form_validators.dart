class FormValidator {
  static String? usernameValidator(String? usernameInput) {
    if (usernameInput == null || usernameInput.isEmpty) {
      return 'Please enter username';
    }
    return null;
  }

  static String? emailValidator(String? emailInput) {
    if (emailInput == null || emailInput.isEmpty) {
      return 'Please enter email';
    }
    return null;
  }

  static String? passwordValidator(String? passwordInput) {
    if (passwordInput == null || passwordInput.isEmpty) {
      return "Password can't be empty";
    }
    return null;
  }
}
