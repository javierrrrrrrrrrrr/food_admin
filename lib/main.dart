import 'package:flutter/material.dart';
import 'package:food_admin/core/constantes/constantes.dart';
import 'package:food_admin/features/auth/presentation/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //usar un color primario
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: kprymaricolor,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      //color orange

      home: const LoginPage(),
    );
  }
}
