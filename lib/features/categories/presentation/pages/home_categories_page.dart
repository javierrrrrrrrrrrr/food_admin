import 'package:flutter/material.dart';
import 'package:food_admin/features/categories/presentation/Provider/category_provider.dart';
import 'package:provider/provider.dart';

import '../../../main_components/widgets/category_or_products_body.dart';
import '../../../main_components/widgets/custom_appbar.dart';

class HomeCategoriesPage extends StatelessWidget {
  const HomeCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Scaffold(
      key: categoryProvider.scaffoldKey,
      appBar: const CustomAppbar(
        icono: Icons.sort,
        title: "Menu",
      ),
      body: ListProductsOrCategoryBody(
        categorieslist: categoryProvider.categorylist,
        buttomtext: "Ir a Productos",
        isproduct: false,
      ),
      //customAppBar(icono: Icons.sort, contex: context, title: "Menu"),
    );
  }
}
