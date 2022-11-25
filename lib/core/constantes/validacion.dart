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

dynamic validateanyCharacter(String? value) {
  if (value == null || value.isEmpty) {
    return 'Este campo es obligatorio';
  }
}

dynamic validateNumber(String value) {
  String patttern = r'(^[0-9]*$)';
  RegExp regExp = RegExp(patttern);
  if (regExp.hasMatch(value) && value.isNotEmpty) {
    return null;
  } else {
    if (value.isEmpty) {
      return 'Este campo es obligatorio';
    } else {
      return 'Solo se permiten numeros';
    }
  }
}
