import 'package:flutter/material.dart';
import 'package:food_admin/features/main_components/widgets/custom_appbar.dart';

class AddCategoriesPage extends StatelessWidget {
  const AddCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(
        icono: Icons.arrow_back_ios_new,
        title: "Agregar nueva Categoria",
      ),
    );
  }
}
