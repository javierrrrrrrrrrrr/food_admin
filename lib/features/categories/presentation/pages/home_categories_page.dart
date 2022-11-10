import 'package:flutter/material.dart';

import '../../../main_components/widgets/custom_appbar.dart';
import '../Widgets/customa_add_buttom.dart';
import '../Widgets/list_element_container.dart';
import '../Widgets/separatedContainer.dart';
import 'add_categorie_page.dart';

class HomeCategoriesPage extends StatelessWidget {
  const HomeCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppbar(
        icono: Icons.sort,
        title: "Menu",
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.8,
            width: size.width,
            // color: Colors.grey,
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return ListElementContainer(
                          index: (index + 1).toString(),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SeparatedContainer();
                      },
                      itemCount: 13),
                )
              ],
            ),
          ),
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
                const CustomAddButtom(text: "Ir a Productos"),
              ],
            ),
          ),
        ],
      ),
      //customAppBar(icono: Icons.sort, contex: context, title: "Menu"),
    );
  }
}
