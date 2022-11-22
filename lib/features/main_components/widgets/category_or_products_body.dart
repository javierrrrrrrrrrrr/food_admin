import 'package:flutter/material.dart';

import '../../categories/presentation/Widgets/customa_add_buttom.dart';
import '../../categories/presentation/Widgets/list_element_container.dart';
import '../../categories/presentation/Widgets/separatedContainer.dart';
import '../../categories/presentation/pages/add_categorie_page.dart';
import '../../products/data/models/product_model.dart';
import '../../products/presentation/pages/add_produt_page.dart';

class ListProductsOrCategoryBody extends StatelessWidget {
  const ListProductsOrCategoryBody({
    Key? key,
    required this.productlist,
    required this.buttomtext,
    required this.isproduct,
  }) : super(key: key);

  final List<Product> productlist;
  final String buttomtext;

  //saber si es producto o categoria
  final bool isproduct;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
            height: size.height * 0.8,
            width: size.width,
            // color: Colors.grey,
            child: CustomWidgetList(
              produc: productlist,
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
                    //navegar a la pagina de agregar categoria
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddCategoriesPage()));
                  }),
              CustomAddButtom(
                text: buttomtext,
                onPressed: () {
                  //naveg ar a la pagina de productos
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddProduct()));
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
    required this.produc,
    required this.isproduct,
  }) : super(key: key);

  final List<Product> produc;
  final bool isproduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return ListElementContainer(
                  product: produc[index],
                  isproduct: isproduct,
                );
              },
              separatorBuilder: (context, index) {
                return const SeparatedContainer();
              },
              itemCount: produc.length),
        )
      ],
    );
  }
}
