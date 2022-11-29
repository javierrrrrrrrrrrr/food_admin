import 'package:flutter/material.dart';
import 'package:food_admin/core/constantes/constantes.dart';
import 'package:food_admin/features/main_components/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import '../../../products/presentation/Providers/up_image_provider.dart';
import '../../../products/presentation/widgets/custom_toggle_buttom.dart';
import '../../data/models/category_model.dart';
import '../Provider/category_provider.dart';
import '../Widgets/custom_categori_field.dart';

class AddCategoriesPage extends StatelessWidget {
  const AddCategoriesPage({Key? key, this.category}) : super(key: key);

  final Category? category;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final categoryprovider = Provider.of<CategoryProvider>(context);
    final imageprovider = Provider.of<UPImageProvider>(context);

    return Scaffold(
      appBar: const CustomAppbar(
        icono: Icons.arrow_back_ios_new,
        title: "Agregar nueva Categoria",
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: categoryprovider.formkeyy,
            child: Stack(
              children: [
                Column(
                  children: [
                    CustomNamedCategorField(
                      initialValue: category != null ? category!.name : null,
                    ),
                    SizedBox(height: size.height * 0.13),
                    const UploadContainer(),
                    SizedBox(height: size.height * 0.1),
                    CustomSaveButtom(onPressed: () async {
                      if (category == null) {
                        if (categoryprovider.isValidForm()) {
                          loadingSpinner(context);
                          bool respuesta = await categoryprovider.addCategories(
                              name: categoryprovider.categoryName!);

                          if (respuesta == true) {
                            if (imageprovider.image != null) {
                              bool respuesta = await imageprovider.uploadImage(
                                  id: categoryprovider.createdcategory!.id,
                                  iscategory: true);
                              if (respuesta == true) {
                                categoryprovider.removeCategory(
                                    categoryprovider.createdcategory!);
                                bool respuesta2 =
                                    await categoryprovider.getCategoriesById(
                                        categoryprovider.createdcategory!.id);

                                if (respuesta2 == true) {
                                  categoryprovider.addCategotutothelist(
                                      categoryprovider.createdcategory!);
                                }

                                Navigator.pop(context);
                                Navigator.pop(context);
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
                              Navigator.pop(context);
                            }

                            // Navigator.pop(context);
                            // Navigator.pop(context);
                          } else {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Error al crear la categoria"),
                              ),
                            );
                          }
                        }
                      } else {
                        //si es una categoria
                        if (categoryprovider.copyCategoryselected == category) {
                          if (imageprovider.image == null) {
                            Navigator.pop(context);
                          } else {
                            loadingSpinner(context);
                            bool respuesta = await imageprovider.uploadImage(
                                id: categoryprovider.copyCategoryselected!.id,
                                iscategory: true);
                            if (respuesta == true) {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            } else {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Error al subir la imagen"),
                                ),
                              );
                            }
                          }
                          //si hubo cambios en los campos

                        } else {
                          loadingSpinner(context);
                          bool respuesta =
                              await categoryprovider.upgradeCategories(
                            id: category!.id,
                            nombre: categoryprovider.copyCategoryselected!.name,
                          );
                          categoryprovider.removeCategory(category!);
                          categoryprovider.addCategotutothelist(
                              categoryprovider.copyCategoryselected!);

                          if (respuesta == true) {
                            if (imageprovider.image != null) {
                              bool respuesta2 = await imageprovider.uploadImage(
                                  id: category!.id, iscategory: true);

                              if (respuesta2 == true) {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              }
                            } else {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            }
                          }
                        }
                        //si no se modifico la categoria

                      }
                    })
                  ],
                ),
                Positioned(
                  right: size.width * 0.2,
                  bottom: size.height * 0.49,
                  child: CustomToggleButtom(
                    height: size.height * 0.06,
                    width: size.width * 0.3,
                    cornerRadius: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UploadContainer extends StatelessWidget {
  const UploadContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageprovider = Provider.of<UPImageProvider>(context);
    return imageprovider.image == null
        ? GestureDetector(
            onTap: () async {
              if (imageprovider.cameraSelectPicture == true) {
                await imageprovider.selectPicture(context, false);
                //Implementar subir la imagen o capturarla con la camara
              } else {
                await imageprovider.selectPicture(context, true);
              }
            },
            child: Container(
              height: size.height * 0.3,
              width: size.width * 0.6,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/no_image.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        : SizedBox(
            height: size.height * 0.3,
            width: size.width * 0.6,
            child: Image(
              image: FileImage(imageprovider.image!),
              fit: BoxFit.cover,
            ),
          );
  }
}

class CustomSaveButtom extends StatelessWidget {
  const CustomSaveButtom({
    Key? key,
    this.width,
    this.onPressed,
  }) : super(key: key);

  final double? width;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: width ?? size.width * 0.9,
      child: MaterialButton(
        color: kprymaricolor,
        height: size.height * 0.08,
        onPressed: onPressed,
        child: Center(
            child: Text(
          "Save",
          style: TextStyle(fontSize: size.height * 0.03, color: Colors.white),
        )),
      ),
    );
  }
}
