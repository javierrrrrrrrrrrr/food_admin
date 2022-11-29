import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constantes/validacion.dart';
import '../Provider/category_provider.dart';

class CustomNamedCategorField extends StatelessWidget {
  const CustomNamedCategorField({
    Key? key,
    this.initialValue,
  }) : super(key: key);

  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final categoryprovider = Provider.of<CategoryProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: TextFormField(
        initialValue: initialValue,
        validator: (value) {
          return validateanyCharacter(value);
        },
        onChanged: (value) {
          categoryprovider.categoryName = value;

          if (initialValue != null) {
            categoryprovider.copyCategoryselected!.name = value;
          }
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Entre el Nombre de la Categoria',
        ),
      ),
    );
  }
}
