import 'package:flutter/material.dart';

import '../../../../core/constantes/constantes.dart';

class CustomLoginTextfield extends StatelessWidget {
  const CustomLoginTextfield({
    Key? key,
    required this.hintext,
    this.icon,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  final String hintext;
  final IconData? icon;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(size.height * 0.01),
            //  border: Border.all(color: Colors.grey.withOpacity(0.5)),
          ),
          height: size.height * 0.1,
          width: size.width * 0.8,
          //  color: Colors.blue[50],

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 0),
            child: TextFormField(
              style: TextStyle(
                  color: kprymaricolor,
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.02),

              //mostrar validacion arriba del campo

              autovalidateMode: AutovalidateMode.onUserInteraction,

              validator: validator,
              onChanged: onChanged,
              decoration: InputDecoration(
                //hacer el campo de texto curvo

                //  contentPadding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                // prefixIcon: Icon(icon, color: kprymaricolor),
                hintText: hintext,
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
              ),
            ),
          ),
        ),
        Positioned(
          left: size.width * 0.04,
          top: size.height * 0.03,
          child: Icon(
            icon,
            color: kprymaricolor,
            size: size.height * 0.035,
          ),
        ),
      ],
    );
  }
}
