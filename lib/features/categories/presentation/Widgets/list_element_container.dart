import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
        child: Slidable(
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            closeThreshold: 0.8,
            children: [
              SlidableAction(
                onPressed: ((context) {}),
                icon: Icons.delete,
                label: "Eliminar",
                spacing: 1,
                foregroundColor: Colors.red.withOpacity(0.8),
                flex: 1,
                autoClose: true,
              ),
              SlidableAction(
                onPressed: ((context) {}),
                icon: Icons.edit,
                label: "Editar",
                spacing: 1,
                foregroundColor: Colors.blue.withOpacity(0.8),
                flex: 1,
                autoClose: true,
              )
            ],
          ),
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
            ],
          ),
        ),
      ),
    );
  }
}
