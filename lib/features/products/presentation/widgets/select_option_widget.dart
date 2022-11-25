import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../categories/presentation/Provider/category_provider.dart';
import '../Providers/products_provider.dart';

class SelectCustomWidget extends StatelessWidget {
  const SelectCustomWidget({
    Key? key,
    required this.hinttext,
    required this.items,
    required this.onChanged,
    this.value,
  }) : super(key: key);

  final String hinttext;
  final List<DropdownMenuItem<String>> items;
  final void Function(String?) onChanged;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

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
            hint: Text(hinttext),
            value: value,
            items: items,
            onChanged: onChanged,
          )),
        ));
  }
}
