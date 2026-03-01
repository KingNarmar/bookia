bool isEmailValid(String email) {
  return RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  ).hasMatch(email);
}

bool isPasswordValid(String password) {
  return RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}$").hasMatch(password);
}

bool isNameValid(String name) {
  return RegExp(r"^[a-zA-Zs'-]+$").hasMatch(name);
}

bool isEgyNymberValid(String number) {
  return RegExp(r'^01[0125][0-9]{8}$').hasMatch(number);
}