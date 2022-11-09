import 'package:flutter/material.dart';

class CustomPictureContainer extends StatelessWidget {
  const CustomPictureContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.3,
      width: size.width * 0.9,
      child: const Image(image: AssetImage('assets/icon.png')),
    );
  }
}
