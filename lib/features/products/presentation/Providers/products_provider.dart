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
  Product? copyProductselected;

  //campos del formulario para agregar productos

  String? productname;
  String? productdescription;
  String productofertprice = "";
  String productnominalprice = "";

  int? rating;
  String? selectedcategory;

  int? selectedcategoryid;

  //
  String? productoCategoryNameSelected;
  //

  //metodo para actulizar la categoria en el drop down

  deletedProduct(Product product) async {
    productsList.remove(product);
    productsList
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    notifyListeners();
  }

  String changecategoryvalue(String value) {
    selectedcategory = value;
    productoCategoryNameSelected = value;
    notifyListeners();

    return selectedcategory!;
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
    productsList
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
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
      //ordenar alfabeticamente sin tener en cuenta las mayuculas
      productsList
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

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
    required String description,
    //  required int rating,
    required bool isrecomended,
  }) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('${apiUrl}products/'));
    request.body = json.encode({
      "name": nombre,
      // "rating": rating,
      "isRecommended": isrecomended,
      "description": description,
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

  Future<bool> updateProduct(
      {required Product newproduct, required Product actulyproduct}) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('PUT', Uri.parse('${apiUrl}products/${actulyproduct.id}'));
    request.body = json.encode({
      "name": newproduct.name,
      "rating": newproduct.rating,
      "isRecommended": newproduct.isRecommended,
      "description": newproduct.description,
      "price": newproduct.price,
      "category": newproduct.category!.id
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var respuesta = await response.stream.bytesToString();
      // print(respuesta);
      Map<String, dynamic> decoderesp = json.decode(respuesta);
      createdpreduct = Product.fromMap(decoderesp);
      productsList.remove(actulyproduct);
      productsList.add(createdpreduct!);
      productsList
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      notifyListeners();

      return true;
      //  print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  Future<bool> deleteProduct(Product product) async {
    var request =
        http.Request('DELETE', Uri.parse('${apiUrl}products/${product.id}'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      productsList.remove(product);
      productsList
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
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
      productsList
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      notifyListeners();
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
