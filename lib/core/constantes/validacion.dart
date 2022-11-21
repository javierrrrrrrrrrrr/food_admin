dynamic validateEmail(String? value) {
  String gmailpatter =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(gmailpatter);
  if (regExp.hasMatch(value ?? "")) {
    return null;
  } else {
    return 'Introduce un correo valido';
  }
}

dynamic validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Introduce una contraseña';
  } else if (value.length < 6) {
    return 'La contraseña debe tener al menos 6 caracteres';
  } else {
    return null;
  }
}
