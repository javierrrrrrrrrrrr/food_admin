import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../core/constantes/constantes.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  //////
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String password = "";
  String email = "";
  String error = "";
  //////
  ///
  ///
  ///
  ///

////////////////////////////////////////////
  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }

  Future<bool> loginUser(
      {required String email, required String password}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse("${apiUrl}auth/login"));
    request.body = json.encode({"email": email, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      if (response.statusCode == 401) {
        error = "Usuario o contraseña incorrectos";
        return false;
      } else {
        error = "Error de conexion";
        return false;
      }
    }
  }
}
