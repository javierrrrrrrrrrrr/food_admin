import 'package:flutter/material.dart';

import '../../../main_components/widgets/category_or_products_body.dart';
import '../../../main_components/widgets/custom_appbar.dart';

class HomeCategoriesPage extends StatelessWidget {
  const HomeCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return const Scaffold(
      appBar: CustomAppbar(
        icono: Icons.sort,
        title: "Menu",
      ),
      body: ListProductsOrCategoryBody(
        productlist: [],
        buttomtext: "Ir a Productos",
        isproduct: false,
      ),
      //customAppBar(icono: Icons.sort, contex: context, title: "Menu"),
    );
  }
}
