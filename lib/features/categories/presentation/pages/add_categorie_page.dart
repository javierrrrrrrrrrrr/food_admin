import 'package:flutter/material.dart';
import 'package:food_admin/core/constantes/constantes.dart';
import 'package:food_admin/features/main_components/widgets/custom_appbar.dart';

import '../Widgets/custom_categori_field.dart';

class AddCategoriesPage extends StatelessWidget {
  const AddCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const CustomAppbar(
        icono: Icons.arrow_back_ios_new,
        title: "Agregar nueva Categoria",
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomNamedCategorField(),
              SizedBox(height: size.height * 0.1),
              const UploadContainer(),
              SizedBox(height: size.height * 0.1),
              CustomSaveButtom(
                onPressed: () {},
              )
            ],
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
    return GestureDetector(
      onTap: () {
        //Implementar subir la imagen o capturarla con la camara
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
