import 'package:flutter/material.dart';
import 'package:food_admin/core/constantes/constantes.dart';
import 'package:food_admin/features/categories/presentation/Provider/category_provider.dart';
import 'package:food_admin/features/main_components/pages/control_page.dart';
import 'package:food_admin/features/products/presentation/Providers/up_image_provider.dart';
import 'package:provider/provider.dart';

import 'features/auth/presentation/Providers/login_provider.dart';
import 'features/products/presentation/Providers/products_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => UPImageProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => LoginProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => ProductProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => CategoryProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

      home: const ControlPage(),
    );
  }
}
