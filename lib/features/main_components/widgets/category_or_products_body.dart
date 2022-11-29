import 'package:flutter/material.dart';
import 'package:food_admin/features/categories/data/models/category_model.dart';
import 'package:food_admin/features/categories/presentation/Provider/category_provider.dart';
import 'package:food_admin/features/products/presentation/Providers/products_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/constantes/constantes.dart';
import '../../categories/presentation/Widgets/customa_add_buttom.dart';
import '../../categories/presentation/Widgets/list_element_container.dart';
import '../../categories/presentation/Widgets/separatedContainer.dart';
import '../../categories/presentation/pages/add_categorie_page.dart';
import '../../products/data/models/product_model.dart';
import '../../products/presentation/Providers/up_image_provider.dart';
import '../../products/presentation/pages/add_produt_page.dart';

class ListProductsOrCategoryBody extends StatelessWidget {
  const ListProductsOrCategoryBody({
    Key? key,
    this.productlist,
    required this.buttomtext,
    required this.isproduct,
    this.categorieslist,
  }) : super(key: key);

  final List<Product>? productlist;
  final List<Category>? categorieslist;
  final String buttomtext;

  //saber si es producto o categoria
  final bool isproduct;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final imageProvider = Provider.of<UPImageProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    return Column(
      children: [
        SizedBox(
            height: size.height * 0.8,
            width: size.width,
            // color: Colors.grey,
            child: CustomWidgetList(
              produc: productlist ?? [],
              categorieslist: categorieslist ?? [],
              isproduct: isproduct,
            )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAddButtom(
                  text: "Agregar Categoria",
                  onPressed: () {
                    imageProvider.setimage();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddCategoriesPage()));
                    //navegar a la pagina de agregar categoria
                  }),
              CustomAddButtom(
                text: buttomtext,
                onPressed: () async {
                  loadingSpinner(context);
                  //setando valores
                  imageProvider.pictureIsSelected = false;
                  imageProvider.setimage();
                  productProvider.selectedcategory = null;
                  productProvider.rating = null;

                  //
                  bool respuesta = await categoryProvider.getCategories();
                  if (respuesta == true) {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddProduct()));
                  } else {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Error al cargar las categorias"),
                      ),
                    );
                  }
                  //naveg ar a la pagina de productos
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CustomWidgetList extends StatelessWidget {
  const CustomWidgetList({
    Key? key,
    this.produc,
    required this.isproduct,
    this.categorieslist,
  }) : super(key: key);

  final List<Product>? produc;
  final List<Category>? categorieslist;
  final bool isproduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return isproduct == true
                    ? ListElementContainer(
                        product: produc![index],
                        isproduct: isproduct,
                      )
                    : ListElementContainer(
                        category: categorieslist![index],
                        isproduct: isproduct,
                      );
              },
              separatorBuilder: (context, index) {
                return const SeparatedContainer();
              },
              itemCount:
                  isproduct == true ? produc!.length : categorieslist!.length),
        )
      ],
    );
  }
}
