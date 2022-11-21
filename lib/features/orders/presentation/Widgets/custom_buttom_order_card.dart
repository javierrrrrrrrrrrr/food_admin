import 'package:flutter/material.dart';

import '../../../../core/constantes/constantes.dart';

class ButtomOrderCard extends StatelessWidget {
  const ButtomOrderCard({
    Key? key,
    required this.texto,
    required this.color,
    this.isborder,
    this.onPressed,
    this.height,
    this.width,
  }) : super(key: key);

  final String texto;
  final Color color;
  final bool? isborder;
  final void Function()? onPressed;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? size.height * 0.03,
        width: width ?? size.width * 0.18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.height * 0.003),
          boxShadow: [
            BoxShadow(
              color: isborder == true
                  ? Colors.orange.withOpacity(0.5)
                  : Colors.black.withOpacity(0.15),
              blurRadius: 5,
              offset: const Offset(0, 0),
            ),
          ],
          color: color,
          border: isborder == true ? Border.all(color: kprymaricolor) : null,
        ),
        child: Center(
            child: Text(texto,
                style: isborder == true
                    ? const TextStyle(color: kprymaricolor)
                    : const TextStyle(color: Colors.white))),
      ),
    );
  }
}
