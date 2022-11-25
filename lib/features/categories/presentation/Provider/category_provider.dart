import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constantes/constantes.dart';
import '../../data/models/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  //////
  List<Category> categorylist = [];

  ///////

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

  Future<void> addCategories() async {}
  Future<void> upgradeCategories() async {}
}
