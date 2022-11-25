import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_admin/features/products/data/models/product_model.dart';

import '../../../../core/constantes/constantes.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  //llave del scaffold de la pagina de productos
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  //llave del formulario de la pagina de productos
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  //lista de productos
  List<Product> productsList = [];
  Product? createdpreduct;

  //campos del formulario para agregar productos

  String? productname;
  String productofertprice = "";
  String productnominalprice = "";

  int? rating;
  String? selectedcategory;

  int? selectedcategoryid;

  //metodo para actulizar la categoria en el drop down

  changecategoryvalue(String value) {
    selectedcategory = value;
    notifyListeners();
  }

  changeratingvalue(int value) {
    rating = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }

  addproducttoList() {
    productsList.add(createdpreduct!);
    notifyListeners();
  }

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

  Future<bool> addProduct({
    required String nombre,
    required int categoryid,
    required double price,
  }) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('${apiUrl}products/'));
    request.body = json.encode({
      "name": nombre,
      "rating": 0,
      "isRecommended": false,
      "description": "",
      "price": price,
      "category": categoryid
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      var respuesta = await response.stream.bytesToString();
      // print(respuesta);
      Map<String, dynamic> decoderesp = json.decode(respuesta);
      createdpreduct = Product.fromMap(decoderesp);
      // productsList.add(createdpreduct!);

      // productsList.add(Product.fromMap(json.decode(respuesta)['products']));
      notifyListeners();
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

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

  Future<bool> getProductByid(int id) async {
    var request = http.Request('GET', Uri.parse('${apiUrl}products/$id'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var respuesta = await response.stream.bytesToString();
      Map<String, dynamic> decoderesp = json.decode(respuesta);
      createdpreduct = Product.fromMap(decoderesp);
      productsList.add(createdpreduct!);
      notifyListeners();
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
