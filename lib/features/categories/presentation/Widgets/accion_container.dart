import 'package:flutter/material.dart';

class AccionContainer extends StatelessWidget {
  const AccionContainer({
    Key? key,
    required this.color,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.16,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(size.height * 0.1),
      ),
      //   color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
