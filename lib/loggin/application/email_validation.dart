bool emailValidation(String? email) {
  if (email == null) return false;
  if (email.isEmpty)  return true;
  final emailRegularExpression =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  return emailRegularExpression.hasMatch(email);
}


