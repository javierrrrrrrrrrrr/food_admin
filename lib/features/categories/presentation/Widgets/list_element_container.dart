import 'package:flutter/material.dart';
import 'package:food_admin/features/categories/presentation/Widgets/accion_container.dart';

class ListElementContainer extends StatelessWidget {
  const ListElementContainer({
    Key? key,
    required this.index,
  }) : super(key: key);

  final String index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      width: size.width,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.005),
        child: Row(
          children: [
            Container(
              width: size.width * 0.03,
            ),
            Container(
              height: size.height * 0.06,
              width: size.width * 0.16,
              decoration: BoxDecoration(
                //color: Colors.black,
                //borderRadius: BorderRadius.circular(size.height * 0.1),
                image: DecorationImage(
                  image: AssetImage("assets/recurso$index.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.05,
            ),
            Text(
              "Helados",
              style: TextStyle(fontSize: size.height * 0.028),
            ),
            Container(
              width: size.width * 0.18,
            ),
            AccionContainer(
              color: Colors.blue.withOpacity(0.8),
              icon: Icons.edit,
              text: "Editar",
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            AccionContainer(
              color: Colors.red.withOpacity(0.8),
              icon: Icons.delete,
              text: "Eliminar",
            ),
          ],
        ),
      ),
    );
  }
}
