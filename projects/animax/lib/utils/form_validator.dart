String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return "Enter a valid email address";
  } else if (!regex.hasMatch(value)) {
    return 'Email address is invalid';
  } else {
    return null;
  }
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return ('Enter a valid password');
  } else if (value.length < 6 || value.length > 10) {
    return 'Minimum length 6, maximum length 10';
  } else {
    return null;
  }
}
