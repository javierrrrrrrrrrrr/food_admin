import 'package:flutter/material.dart';
import 'package:food_admin/features/auth/presentation/widgets/custom_text_field.dart';

import '../../../../core/constantes/constantes.dart';

class LoginCenterContainer extends StatelessWidget {
  const LoginCenterContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size.height * 0.01),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: size.height * 0.1,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Center(
                child: Text(
              'Admin Login',
              style: TextStyle(
                  color: kprymaricolor,
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.03),
            )),
          ),
          const CustomLoginTextfield(hintext: "Email Id", icon: Icons.email),
          const CustomLoginTextfield(
              hintext: "Password", icon: Icons.lock_rounded),
        ],
      ),
    );
  }
}
