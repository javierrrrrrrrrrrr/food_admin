import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_admin/features/products/data/models/product_model.dart';

import '../../../../core/constantes/constantes.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<Product> productsList = [];

  Future<bool> getProducts() async {
    var request = http.Request('GET', Uri.parse('${apiUrl}products/'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var respuesta = await response.stream.bytesToString();

      final Map<String, dynamic> decodedResp = json.decode(respuesta);
      productsList = (decodedResp['products'] as List)
          .map((e) => Product.fromMap(e))
          .toList();

      return true;
    } else {
      print(response.reasonPhrase);
      notifyListeners();
      return false;
    }
  }

  Future<void> addProduct(Product product) async {}

  Future<void> updateProduct(Product product) async {}

  Future<bool> deleteProduct(Product product) async {
    var request =
        http.Request('DELETE', Uri.parse('${apiUrl}products/${product.id}'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      productsList.remove(product);
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
