abstract class AppValidators {
  AppValidators._(); // يمنع إنشاء object بالغلط

  // ------------------- Regex -------------------
  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static final RegExp _passwordRegex = RegExp(
    r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}$',
  );

  static final RegExp _nameRegex = RegExp(
    r"^[a-zA-Z\s'-]+$",
  ); // ✅ لاحظ: \s بدل s

  static final RegExp _egyNumberRegex = RegExp(r'^01[0125][0-9]{8}$');

  static final RegExp _phoneRegex = RegExp(r'^[0-9]{8,15}$');

  // ------------------- Checks -------------------
  static bool isEmailValid(String email) => _emailRegex.hasMatch(email);

  static bool isPasswordValid(String password) =>
      _passwordRegex.hasMatch(password);

  static bool isNameValid(String name) => _nameRegex.hasMatch(name);

  static bool isEgyNumberValid(String number) =>
      _egyNumberRegex.hasMatch(number);

  // ------------------- Validators -------------------
  static String? email(String? input) {
    final value = input?.trim() ?? '';
    if (value.isEmpty) return "Enter Your Email";
    if (!isEmailValid(value)) return "Enter Your Correct Email";
    return null;
  }

  static String? name(String? input) {
    final value = input?.trim() ?? '';
    if (value.isEmpty) return "Please Enter the User Name";
    if (value.length < 3 || !isNameValid(value)) {
      return "Please Enter Valid Name More than 3 Chr";
    }
    return null;
  }

  static String? Function(String?) password({
    String emptyMessage = "Create Your Password",
    String invalidMessage =
        "Password Should Be (6+ chars, upper, lower, digit)",
  }) {
    return (String? input) {
      final value = input?.trim() ?? '';
      if (value.isEmpty) return emptyMessage;
      if (!isPasswordValid(value)) return invalidMessage;
      return null;
    };
  }

  static String? Function(String?) confirmPassword({
    required String Function() passwordProvider,
  }) {
    return (String? input) {
      final confirm = input?.trim() ?? '';
      final password = passwordProvider().trim();

      if (confirm.isEmpty) return "Confirm Password";
      if (confirm != password) return "password not matching";
      return null;
    };
  }

  static String? address(String? input) {
    final value = input?.trim() ?? '';
    if (value.isEmpty) return "Please Enter Your Address";
    if (value.length < 5) return "Address is too short";
    return null;
  }

  static String? phone(String? input) {
    final value = input?.trim() ?? '';
    if (value.isEmpty) return "Please Enter Your Phone Number";
    if (!_phoneRegex.hasMatch(value)) {
      return "Please Enter Valid Phone Number";
    }
    return null;
  }
}
