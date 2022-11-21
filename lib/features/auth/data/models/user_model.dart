// import 'dart:convert';

// import '../../domain/entities/user.dart';

// class UserModel extends User {
//   final String? token;

//   const UserModel({
//     this.token,
//     required String name,
//     required String email,
//     int? id,
//     String? image,
//     String? role,
//     String? mobileUuid,
//     String? address,
//     String? phone,
//     String? reference,
//     String? createdAt,
//     bool? isDeleted,
//     String? verified,
//   }) : super(
//           name: name,
//           email: email,
//           id: id,
//           image: image,
//           role: image,
//           mobileUuid: mobileUuid,
//           address: address,
//           phone: phone,
//           reference: reference,
//           createdAt: createdAt,
//           isDeleted: isDeleted,
//           verified: verified,
//         );

//   @override
//   List<Object?> get props => [
//         name,
//         email,
//         id,
//         image,
//         role,
//         mobileUuid,
//         address,
//         phone,
//         reference,
//         createdAt,
//         isDeleted,
//         verified,
//         token,
//       ];

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       "name": name,
//       "email": email,
//       "id": id,
//       "image": image,
//       "role": image,
//       "mobileUuid": mobileUuid,
//       "address": address,
//       "phone": phone,
//       "reference": reference,
//       "createdAt": createdAt,
//       "isDeleted": isDeleted,
//       "verified": verified,
//       "token": token,
//     };
//   }

//   factory UserModel.fromMap(Map<String, dynamic> map) {
//     return UserModel(
//       name: map["user"]["name"],
//       email: map["user"]["email"],
//       id: map["user"]["id"],
//       image: map["user"]["image"],
//       role: map["user"]["role"],
//       mobileUuid: map["user"]["mobileUuid"],
//       address: map["user"]["address"],
//       phone: map["user"]["phone"],
//       reference: map["user"]["reference"],
//       createdAt: map["user"]["createdAt"],
//       isDeleted: map["user"]["isDeleted"],
//       verified: map["user"]["verified"],
//       token: map["jwt"],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory UserModel.fromJson(String source) =>
//       UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
// }
