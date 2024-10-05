String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Name is Required";
  }
  return null;
}

String? emailValidator(String? value) {
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  if (value == null || value.isEmpty) {
    return "Email is Required";
  }
  if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email';
  }

  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters long';
  }
  final RegExp passwordRegex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$',
  );
  if (!passwordRegex.hasMatch(value)) {
    return '''Password must contain at least:
- One uppercase letter
- One lowercase letter
- One digit
- One special character (@, \$, !, %, *, ?, &)''';
  }
  return null;
}
