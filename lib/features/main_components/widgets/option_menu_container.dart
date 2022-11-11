import 'package:flutter/material.dart';

class OptionMenuContainer extends StatelessWidget {
  const OptionMenuContainer({
    Key? key,
    required this.name,
    required this.bigicon,
    required this.color,
    this.onPressed,
  }) : super(key: key);

  final String name;
  final IconData bigicon;
  final Color color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: size.height * 0.2,
        width: size.width * 0.4,
        decoration: BoxDecoration(
            //borde al contenedro
            border: Border.all(
              color: Colors.black.withOpacity(0.2),
            ),
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.04),
            Icon(
              bigicon,
              color: color,
              size: size.height * 0.08,
            ),
            Text(
              name,
              style: TextStyle(fontSize: size.height * 0.03),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Icon(
            //       Icons.delete,
            //       color: Colors.red.withOpacity(0.8),
            //     ),
            //     Icon(
            //       Icons.add,
            //       color: Colors.blue.withOpacity(0.8),
            //     ),
            //     Icon(
            //       Icons.edit,
            //       color: Colors.green.withOpacity(0.8),
            //     ),
            //     Icon(
            //       Icons.mark_chat_read_sharp,
            //       color: Colors.yellow.withOpacity(0.8),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
