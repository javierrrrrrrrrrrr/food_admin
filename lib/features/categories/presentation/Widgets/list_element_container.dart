import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_admin/features/categories/data/models/category_model.dart';
import 'package:food_admin/features/categories/presentation/Provider/category_provider.dart';
import 'package:food_admin/features/products/data/models/product_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/constantes/constantes.dart';
import '../../../products/presentation/Providers/products_provider.dart';

class ListElementContainer extends StatelessWidget {
  const ListElementContainer({
    Key? key,
    this.product,
    this.isproduct,
    this.category,
  }) : super(key: key);

  final Product? product;
  final Category? category;
  final isproduct;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return Container(
      height: size.height * 0.1,
      width: size.width,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.005),
        child: Slidable(
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            closeThreshold: 0.8,
            children: [
              SlidableAction(
                onPressed: ((context) async {
                  if (isproduct == true) {
                    //falta un cartel de confirmacion
                    loadingSpinner(productProvider.scaffoldKey.currentContext!);
                    bool resp = await productProvider.deleteProduct(product!);
                    if (resp == true) {
                      Navigator.pop(
                          productProvider.scaffoldKey.currentContext!);
                      ScaffoldMessenger.of(
                              productProvider.scaffoldKey.currentContext!)
                          .showSnackBar(
                        const SnackBar(
                          content: Text("Producto Eliminado"),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 1),
                        ),
                      );
                    } else {
                      Navigator.pop(
                          productProvider.scaffoldKey.currentContext!);
                      ScaffoldMessenger.of(
                              productProvider.scaffoldKey.currentContext!)
                          .showSnackBar(
                        const SnackBar(
                          content: Text("Error al Eliminar"),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  } else {
                    //eliminar categoria
                    loadingSpinner(
                        categoryProvider.scaffoldKey.currentContext!);
                    bool resp =
                        await categoryProvider.deleteCategories(category!);
                    if (resp == true) {
                      Navigator.pop(
                          categoryProvider.scaffoldKey.currentContext!);
                      ScaffoldMessenger.of(
                              categoryProvider.scaffoldKey.currentContext!)
                          .showSnackBar(
                        const SnackBar(
                          content: Text("Producto Eliminado"),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 1),
                        ),
                      );
                    } else {
                      Navigator.pop(
                          categoryProvider.scaffoldKey.currentContext!);
                      ScaffoldMessenger.of(
                              categoryProvider.scaffoldKey.currentContext!)
                          .showSnackBar(
                        const SnackBar(
                          content: Text("Error al Eliminar"),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }

                    ///

                  }
                }),
                icon: Icons.delete,
                label: "Eliminar",
                spacing: 1,
                foregroundColor: Colors.red.withOpacity(0.8),
                flex: 1,
                autoClose: true,
              ),
              SlidableAction(
                onPressed: ((context) {}),
                icon: Icons.edit,
                label: "Editar",
                spacing: 1,
                foregroundColor: Colors.blue.withOpacity(0.8),
                flex: 1,
                autoClose: true,
              )
            ],
          ),
          child: Row(
            children: [
              Container(
                width: size.width * 0.03,
              ),
              SizedBox(
                  height: size.height * 0.06,
                  width: size.width * 0.16,
                  child: isproduct == true

                      //si es producto
                      ? product!.image == 'no-image.png'
                          ? ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(size.width * 0.02),
                              ),
                              child: Image.asset(
                                'assets/no_image.jpeg',
                                fit: BoxFit.cover,
                              ),
                            )
                          : FadeInImage(
                              fit: BoxFit.fill,
                              placeholder:
                                  const AssetImage('assets/loading.gif'),
                              image: NetworkImage(
                                '${apiUrl}uploads/products/${product!.id}',
                              ))
                      :
                      // si es categoria
                      //ADONYS TIENE QUE ARREEGLAR ESTO
                      category!.image == 'no-image.png'
                          ? ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(size.width * 0.02),
                              ),
                              child: Image.asset(
                                'assets/no_image.jpeg',
                                fit: BoxFit.cover,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(size.width * 0.02),
                              ),
                              child: Image.asset(
                                'assets/no_image.jpeg',
                                fit: BoxFit.cover,
                              ),
                            )

                  //
                  ),
              SizedBox(
                width: size.width * 0.05,
              ),
              Text(
                isproduct == true ? product!.name : category!.name,
                style: TextStyle(fontSize: size.height * 0.028),
              ),
              Container(
                width: size.width * 0.18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
