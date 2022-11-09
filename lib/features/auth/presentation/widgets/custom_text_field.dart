import 'package:flutter/material.dart';

import '../../../../core/constantes/constantes.dart';

class CustomLoginTextfield extends StatelessWidget {
  const CustomLoginTextfield({
    Key? key,
    required this.hintext,
    required this.icon,
  }) : super(key: key);

  final String hintext;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: size.height * 0.038),
        prefixIcon: Icon(icon, color: kprymaricolor),
        hintText: hintext,
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
      ),
    );
  }
}
