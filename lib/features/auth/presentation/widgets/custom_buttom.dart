import 'package:flutter/material.dart';

import '../../../../core/constantes/constantes.dart';

class CustomLoginButtom extends StatelessWidget {
  const CustomLoginButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.9,
      child: MaterialButton(
        //bordes redondeados
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.height * 0.01),
        ),
        color: kprymaricolor,
        onPressed: () {},
        child: Center(
          child: Text(
            "Login",
            style:
                TextStyle(color: Colors.white, fontSize: size.height * 0.025),
          ),
        ),
      ),
    );
  }
}
