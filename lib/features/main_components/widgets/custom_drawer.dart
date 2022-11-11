import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
        child: Column(
      children: [
        const PictureDrawerContainer(),
        SizedBox(
          height: size.height * 0.06,
        ),
        const DrawerColumnBody(),
      ],
    ));
  }
}

class DrawerColumnBody extends StatelessWidget {
  const DrawerColumnBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: const [
        DrawerRow(
          icon: Icons.production_quantity_limits,
          texto: "Productos",
        ),
        DrawerRow(
            icon: Icons.auto_awesome_motion_outlined, texto: "Categorias"),
        DrawerRow(icon: Icons.grading_outlined, texto: "Ordenes"),
        DrawerRow(icon: Icons.receipt_long_outlined, texto: "Reportes"),
      ],
    ));
  }
}

class DrawerRow extends StatelessWidget {
  const DrawerRow({
    Key? key,
    required this.icon,
    required this.texto,
  }) : super(key: key);

  final IconData icon;
  final String texto;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.width * 0.04),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * 0.06,
          ),
          Icon(
            icon,
            size: size.height * 0.06,
          ),
          SizedBox(
            width: size.width * 0.08,
          ),
          Text(texto, style: TextStyle(fontSize: size.height * 0.03)),
        ],
      ),
    );
  }
}

class PictureDrawerContainer extends StatelessWidget {
  const PictureDrawerContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      //color: Colors.red,
      height: size.height * 0.4,
      width: size.width,
      child: Column(children: [
        SizedBox(height: size.height * 0.1),
        CircleAvatar(
          radius: size.height * 0.12,
          backgroundImage: const AssetImage('assets/icon.png'),
        ),
        SizedBox(height: size.height * 0.02),
        Text(
          'John Doe',
          style: TextStyle(
              fontSize: size.height * 0.03,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
