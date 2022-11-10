import 'package:flutter/material.dart';

class CustomNamedCategorField extends StatelessWidget {
  const CustomNamedCategorField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Entre el Nombre de la Categoria',
        ),
      ),
    );
  }
}
