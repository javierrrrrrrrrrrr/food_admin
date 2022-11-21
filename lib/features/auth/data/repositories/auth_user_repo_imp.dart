// import '../../../../core/platform/network/network_info.dart';
// import '../../domain/entities/user.dart';
// import '../../domain/repositories/auth_user_repo.dart';
// import '../datasource/user_data_source.dart';

// class AuthUserRepositoryIMP extends AuthUserRepository {
//   final NetworkInfo networkInfo;
//   final UserDataSource userRemoteDataSource;

//   AuthUserRepositoryIMP(
//       {required this.networkInfo, required this.userRemoteDataSource});

//   @override
//   Future<User> loginUserWithEmailAndPassword(
//       {required String email, required String password}) async {
//     if (await networkInfo.isConnected) {
//       return userRemoteDataSource.loginUserWithEmailAndPassword(
//           email: email, password: password);
//     } else {
//       throw Exception("No hay conexión a internet");
//     }
//     throw UnimplementedError();
//   }
// }
