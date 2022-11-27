import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    Key? key,
    required this.hintext,
    this.paddinhorizontal,
    this.paddinvertical,
    this.onChanged,
    this.validator,
    this.initialvalue,
  }) : super(key: key);

  final String hintext;
  final double? paddinhorizontal;
  final double? paddinvertical;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? initialvalue;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddinhorizontal ?? size.width * 0.03,
      ),
      child: TextFormField(
        initialValue: initialvalue ?? "",
        validator: validator,
        onChanged: onChanged,

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
