import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    Key? key,
    this.title,
    required this.icono,
    this.toolbar,
  }) : super(key: key);

  final String? title;
  final IconData icono;
  final bool? toolbar;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppBar(
      //toolbar
      bottom: toolbar == true
          ? TabBar(
              tabs: [
                Tab(
                  child: Text(
                    "Nuevas",
                    style: TextStyle(fontSize: size.height * 0.023),
                  ),
                ),
                Tab(
                  child: Text(
                    "En Proceso",
                    style: TextStyle(fontSize: size.height * 0.023),
                  ),
                ),
                Tab(
                  child: Text(
                    "Pasadas",
                    style: TextStyle(fontSize: size.height * 0.023),
                  ),
                ),
              ],
            )
          : null,

      centerTitle: true,
      title: title != null ? Text(title!) : null,
      leading: IconButton(
          color: Colors.white,
          onPressed: () {
            //abrir el drawer
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(
            icono,
            size: size.width * 0.1,
          )),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    Size dimesion;

    toolbar == true
        ? dimesion = const Size.fromHeight(kToolbarHeight * 1.8)
        : dimesion = const Size.fromHeight(kToolbarHeight);

    return dimesion;
  }
  //throw UnimplementedError();
}
