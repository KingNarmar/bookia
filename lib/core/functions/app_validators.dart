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
  static String? email(String? input, {String? emptyMessage, String? invalidMessage}) {
    final value = input?.trim() ?? '';
    if (value.isEmpty) return emptyMessage ?? "Enter Your Email";
    if (!isEmailValid(value)) return invalidMessage ?? "Enter Your Correct Email";
    return null;
  }

  static String? name(String? input, {String? emptyMessage, String? invalidMessage}) {
    final value = input?.trim() ?? '';
    if (value.isEmpty) return emptyMessage ?? "Please Enter the User Name";
    if (value.length < 3 || !isNameValid(value)) {
      return invalidMessage ?? "Please Enter Valid Name More than 3 Chr";
    }
    return null;
  }

  static String? Function(String?) password({
    String? emptyMessage,
    String? invalidMessage,
  }) {
    return (String? input) {
      final value = input?.trim() ?? '';
      if (value.isEmpty) return emptyMessage ?? "Create Your Password";
      if (!isPasswordValid(value)) {
        return invalidMessage ??
            "Password Should Be (6+ chars, upper, lower, digit)";
      }
      return null;
    };
  }

  static String? Function(String?) confirmPassword({
    required String Function() passwordProvider,
    String? emptyMessage,
    String? invalidMessage,
  }) {
    return (String? input) {
      final confirm = input?.trim() ?? '';
      final password = passwordProvider().trim();

      if (confirm.isEmpty) return emptyMessage ?? "Confirm Password";
      if (confirm != password) return invalidMessage ?? "password not matching";
      return null;
    };
  }

  static String? address(String? input, {String? emptyMessage, String? invalidMessage}) {
    final value = input?.trim() ?? '';
    if (value.isEmpty) return emptyMessage ?? "Please Enter Your Address";
    if (value.length < 5) return invalidMessage ?? "Address is too short";
    return null;
  }

  static String? phone(String? input, {String? emptyMessage, String? invalidMessage}) {
    final value = input?.trim() ?? '';
    if (value.isEmpty) return emptyMessage ?? "Please Enter Your Phone Number";
    if (!_phoneRegex.hasMatch(value)) {
      return invalidMessage ?? "Please Enter Valid Phone Number";
    }
    return null;
  }
}
