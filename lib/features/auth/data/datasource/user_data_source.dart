// import 'dart:convert';

// import 'package:food_admin/features/auth/data/models/user_model.dart';

// import '../../../../core/constantes/constantes.dart';
// import 'package:http/http.dart' as http;

// abstract class UserDataSource {
//   Future<UserModel> loginUserWithEmailAndPassword(
//       {required String email, required String password});
// }
// ///////////////////////////////////

// class UserDataSourceImple extends UserDataSource {
//   String? token = "";
//   String? error = "";

//   UserDataSourceImple({this.token, this.error});

//   @override
//   Future<UserModel> loginUserWithEmailAndPassword(
//       {required String email, required String password}) async {
//     var headers = {'Content-Type': 'application/json'};
//     var request = http.Request('POST', Uri.parse("${apiUrl}auth/login"));
//     request.body = json.encode({"email": email, "password": password});
//     request.headers.addAll(headers);

//     http.StreamedResponse response = await request.send();
//     if (response.statusCode == 200) {
//       var data = await response.stream.bytesToString();

//       var jsonData = json.decode(data);
//       UserModel user = UserModel.fromMap(jsonData);

//       return user;
//     } else {
//       var data = await response.stream.bytesToString();
//       var jsonData = json.decode(data);
//       error = jsonData["error"];
//       throw Exception(error);
//     }
//   }
// }
