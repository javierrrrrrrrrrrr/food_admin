import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    Key? key,
    this.title,
    required this.icono,
  }) : super(key: key);

  final String? title;
  final IconData icono;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppBar(
      centerTitle: true,
      title: title != null ? Text(title!) : null,
      leading: IconButton(
          color: Colors.white,
          onPressed: () {},
          icon: Icon(
            icono,
            size: size.width * 0.1,
          )),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
  }
  //throw UnimplementedError();
}
