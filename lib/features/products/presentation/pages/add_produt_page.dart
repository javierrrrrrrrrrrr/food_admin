import 'package:flutter/material.dart';
import 'package:food_admin/core/constantes/constantes.dart';
import 'package:food_admin/features/categories/presentation/Provider/category_provider.dart';
import 'package:food_admin/features/main_components/widgets/custom_appbar.dart';
import 'package:food_admin/features/products/presentation/Providers/products_provider.dart';
import 'package:food_admin/features/products/presentation/Providers/up_image_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/constantes/validacion.dart';
import '../../../categories/data/models/category_model.dart';
import '../../../categories/presentation/pages/add_categorie_page.dart';
import '../widgets/custom_field.dart';
import '../widgets/custom_toggle_buttom.dart';
import '../widgets/select_option_widget.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageprovider = Provider.of<UPImageProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);

    List<int> raiting = [1, 2, 3, 4, 5];
    return Scaffold(
      appBar: const CustomAppbar(
        icono: Icons.sort,
        title: "Agregar Producto",
      ),
      body: Padding(
        padding: EdgeInsets.only(top: size.height * 0.03),
        child: Center(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: productProvider.formkey,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const ContainerWithUploadIMage(),
                      SizedBox(height: size.height * 0.015),
                      SizedBox(height: size.height * 0.03),
                      CustomField(
                        hintext: "Nombre del Producto",
                        onChanged: (value) {
                          productProvider.productname = value;
                        },
                        validator: (value) {
                          return validateanyCharacter(value);
                        },
                      ),
                      SelectCustomWidget(
                        hinttext: "Seleccione una categoria",
                        value: productProvider.selectedcategory,
                        onChanged: (value) {
                          productProvider.changecategoryvalue(value!);
                        },
                        items:
                            categoryProvider.categorylist.map((Category value) {
                          return DropdownMenuItem<String>(
                            value: value.name,
                            onTap: (() =>
                                productProvider.selectedcategoryid = value.id),
                            child: Text(value.name),
                          );
                        }).toList(),
                      ),
                      SelectCustomWidget(
                        value: productProvider.rating == null
                            ? null
                            : productProvider.rating.toString(),
                        onChanged: (value) {
                          productProvider.changeratingvalue(int.parse(value!));
                        },
                        hinttext: "Seleccione una valoracin para el prducto",
                        items: raiting.map((int value) {
                          return DropdownMenuItem<String>(
                            value: value.toString(),
                            onTap: (() => productProvider.rating = value),
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                      CustomField(
                        hintext: "Precio del producto",
                        onChanged: (value) {
                          productProvider.productnominalprice = value;
                        },
                        validator: (value) {
                          return validateNumber(value!);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.03,
                            vertical: size.height * 0.03),
                        child: CustomSaveButtom(
                          onPressed: () async {
                            if (productProvider.isValidForm() &&
                                imageprovider.image != null) {
                              loadingSpinner(context);
                              bool respuesta = await productProvider.addProduct(
                                nombre: productProvider.productname!,
                                categoryid: productProvider.selectedcategoryid!,
                                price: double.parse(
                                    productProvider.productnominalprice),
                              );
                              if (respuesta == true) {
                                bool respuesta2 =
                                    await imageprovider.uploadImage(
                                  id: productProvider.createdpreduct!.id,
                                );
                                // productProvider.productsList.remove(productProvider.createdpreduct);

                                if (respuesta2 == true) {
                                  bool respuesta3 =
                                      await productProvider.getProductByid(
                                          productProvider.createdpreduct!.id);

                                  if (respuesta3 == true) {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  } else {
                                    //mensaje de error al obtener prducto
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text("Error al crear el producto"),
                                      ),
                                    );
                                  }

                                  //mensaje de eeror al subir lka imagen
                                } else {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Error al subir la imagen"),
                                    ),
                                  );
                                }
                              } else {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Error al crear el producto"),
                                  ),
                                );
                              }
                            } else {
                              if (productProvider.isValidForm()) {
                                loadingSpinner(context);
                                bool respuesta =
                                    await productProvider.addProduct(
                                  nombre: productProvider.productname!,
                                  categoryid:
                                      productProvider.selectedcategoryid!,
                                  price: double.parse(
                                      productProvider.productnominalprice),
                                );
                                productProvider.addproducttoList();

                                if (respuesta == true) {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                } else {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text("Error al crear el producto"),
                                    ),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Error al crear el producto"),
                                  ),
                                );
                              }
                            }
                          },
                          width: size.width,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: size.height * 0.001,
                  left: size.width * 0.65,
                  child: const CustomToggleButtom(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerWithUploadIMage extends StatelessWidget {
  const ContainerWithUploadIMage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pruebaprovider = Provider.of<UPImageProvider>(context);

    final size = MediaQuery.of(context).size;
    return pruebaprovider.pictureIsSelected == true
        ? SizedBox(
            height: size.height * 0.35,
            width: size.width * 0.9,
            child: Image(
              image: FileImage(pruebaprovider.image!),
              fit: BoxFit.fill,
            ),
          )
        : GestureDetector(
            onTap: () async {
              await pruebaprovider.selectPicture(context);
            },
            child: Container(
              height: size.height * 0.35,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(241, 241, 241, 1),
                //bordes
                border: Border.all(
                  color: kprymaricolor.withOpacity(0.5),
                  width: size.height * 0.01,
                ),
              ),
              //color: Colors.red,
              child: const Image(
                image: AssetImage("assets/upload.jpg"),
                //fit: BoxFit.fill,
              ),
            ),
          );
  }
}
