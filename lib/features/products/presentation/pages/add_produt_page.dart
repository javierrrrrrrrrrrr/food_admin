import 'package:flutter/material.dart';
import 'package:food_admin/core/constantes/constantes.dart';
import 'package:food_admin/features/categories/presentation/Provider/category_provider.dart';
import 'package:food_admin/features/main_components/widgets/custom_appbar.dart';
import 'package:food_admin/features/products/presentation/Providers/up_image_provider.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../categories/data/models/category_model.dart';
import '../../../categories/presentation/pages/add_categorie_page.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pruebaProvider = Provider.of<UPImageProvider>(context);

    return Scaffold(
      appBar: const CustomAppbar(
        icono: Icons.sort,
        title: "Agregar Producto",
      ),
      body: Padding(
        padding: EdgeInsets.only(top: size.height * 0.03),
        child: Center(
          child: Column(
            children: [
              const ContainerWithUploadIMage(),
              SizedBox(height: size.height * 0.03),
              const CustomToggleButtom(),
              const CustomField(hintext: "Nombre del Producto"),
              const selectCategoriyWidget(),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.028,
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                    width: size.width * 0.4,
                    child: CustomField(
                        hintext: "Precio Nominal",
                        paddinhorizontal: size.width * 0.001,
                        paddinvertical: 0),
                  ),
                  SizedBox(
                    width: size.width * 0.15,
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                    width: size.width * 0.4,
                    child: CustomField(
                        hintext: "Precio en oferta",
                        paddinhorizontal: size.width * 0.001,
                        paddinvertical: 0),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                    vertical: size.height * 0.01),
                child: CustomSaveButtom(
                  onPressed: () async {
                    const CircularProgressIndicator();
                    await pruebaProvider.uploadImage();
                  },
                  width: size.width,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class selectCategoriyWidget extends StatelessWidget {
  const selectCategoriyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
      child: Container(
          height: size.height * 0.07,
          width: size.width * 0.95,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(size.height * 0.008),
            border: Border.all(
                color: Colors.grey, style: BorderStyle.solid, width: 0.80),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: const Text("Seleccione una categoria"),
              value: categoryProvider.selectedcategory,
              items: categoryProvider.categorylist.map((Category value) {
                return DropdownMenuItem<String>(
                  value: value.name,
                  child: Text(value.name),
                );
              }).toList(),
              onChanged: (value) {
                categoryProvider.changecategoryvalue(value!);
              },
            ),
          )),
    );
  }
}

class CustomField extends StatelessWidget {
  const CustomField({
    Key? key,
    required this.hintext,
    this.paddinhorizontal,
    this.paddinvertical,
  }) : super(key: key);

  final String hintext;
  final double? paddinhorizontal;
  final double? paddinvertical;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: paddinhorizontal ?? size.width * 0.03,
          vertical: paddinvertical ?? size.height * 0.015),
      child: TextField(
        //campo cuadrado
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(size.height * 0.01),
            ),
          ),
          labelText: hintext,
        ),
      ),
    );
  }
}

class CustomToggleButtom extends StatelessWidget {
  const CustomToggleButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pruebaprovider = Provider.of<UPImageProvider>(context);
    return ToggleSwitch(
      minWidth: 90.0,
      minHeight: 70.0,
      initialLabelIndex: 0,
      cornerRadius: 20.0,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      icons: const [
        Icons.camera,
        Icons.image,
      ],
      iconSize: 30.0,
      activeBgColors: [
        [Colors.orange.withOpacity(0.5), Colors.orange],
        [Colors.orange.withOpacity(0.5), Colors.orange]
      ],
      animate:
          true, // with just animate set to true, default curve = Curves.easeIn
      curve: Curves
          .bounceInOut, // animate must be set to true when using custom curve
      onToggle: (index) {
        pruebaprovider.gallerySelectPicture = index == 0 ? false : true;
        print(pruebaprovider.gallerySelectPicture);
      },
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
