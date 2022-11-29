import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constantes/constantes.dart';
import '../../data/models/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> formkeyy = GlobalKey<FormState>();
  //////
  List<Category> categorylist = [];
  String? categoryName;
  Category? createdcategory;
  Category? copyCategoryselected;

  ///////validacion formulario

  removeCategory(Category category) {
    categorylist.remove(category);
    notifyListeners();
  }

  addCategotutothelist(Category category) {
    categorylist.add(createdcategory!);
    notifyListeners();
  }

  bool isValidForm() {
    return formkeyy.currentState?.validate() ?? false;
  }

  Future<bool> getCategoriesById(int id) async {
    var request = http.Request('GET', Uri.parse('${apiUrl}categories/$id'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var respuesta = await response.stream.bytesToString();
      Map<String, dynamic> decoderesp = json.decode(respuesta);

      createdcategory = Category.fromMap(decoderesp);
      return true;
    } else {
      return false;
    }
  }

  ///obtener categorias
  Future<bool> getCategories() async {
    var request = http.Request('GET', Uri.parse('${apiUrl}categories/'));
    request.body = '''''';

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var respuesta = await response.stream.bytesToString();
      Map<String, dynamic> decoderesp = json.decode(respuesta);

      categorylist = (decoderesp['categories'] as List)
          .map((e) => Category.fromMap(e))
          .toList();

      // selectedcategory = categorylist[0].name;

      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  //eliminar categoria
  Future<bool> deleteCategories(Category categori) async {
    var request =
        http.Request('DELETE', Uri.parse('${apiUrl}categories/${categori.id}'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      categorylist.remove(categori);
      notifyListeners();

      return true;
    } else {
      return false;
    }
  }

//adiconar categoria
  Future<bool> addCategories({required String name}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('${apiUrl}categories/'));
    request.body = json.encode(
      {
        "name": name,
      },
    );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var respuesta = await response.stream.bytesToString();
      Map<String, dynamic> decoderesp = json.decode(respuesta);

      createdcategory = Category.fromMap(decoderesp);
      categorylist.add(createdcategory!);
      notifyListeners();

      return true;
    } else {
      return false;
    }
  }

  Future<bool> upgradeCategories(
      {required String nombre, required int id}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('PUT', Uri.parse('${apiUrl}categories/$id'));
    request.body = json.encode({
      "name": nombre,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var respuesta = await response.stream.bytesToString();
      Map<String, dynamic> decoderesp = json.decode(respuesta);

      createdcategory = Category.fromMap(decoderesp);

      // categorylist.add(createdcategory!);
      notifyListeners();
      return true;
    } else {
      return false;
      print(response.reasonPhrase);
    }
  }
}
