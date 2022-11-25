import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main_components/widgets/category_or_products_body.dart';
import '../../../main_components/widgets/custom_appbar.dart';
import '../Providers/products_provider.dart';

class HomeProductsPage extends StatelessWidget {
  const HomeProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      key: productProvider.scaffoldKey,

      appBar: const CustomAppbar(
        icono: Icons.sort,
        title: "Menu",
      ),
      body: SingleChildScrollView(
        child: ListProductsOrCategoryBody(
          productlist: productProvider.productsList,
          buttomtext: "Agregar Producto",
          isproduct: true,
        ),
      ),
      //customAppBar(icono: Icons.sort, contex: context, title: "Menu"),
    );
  }
}
