import 'package:flutter/material.dart';

class SeparatedContainer extends StatelessWidget {
  const SeparatedContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey.withOpacity(0.3),
      height: size.height * 0.004,
      width: size.width,
    );
  }
}
