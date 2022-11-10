import 'package:flutter/material.dart';

import '../../../../core/constantes/constantes.dart';

class CustomAddButtom extends StatelessWidget {
  const CustomAddButtom({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.45,
        decoration: BoxDecoration(
          color: kprymaricolor,
          borderRadius: BorderRadius.circular(size.height * 0.002),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.bold,
          ),

          //
          //fond blod
          //
        )),
      ),
    );
  }
}
