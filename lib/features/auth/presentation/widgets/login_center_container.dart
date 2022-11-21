import 'package:flutter/material.dart';
import 'package:food_admin/core/constantes/validacion.dart';
import 'package:food_admin/features/auth/presentation/Providers/login_provider.dart';
import 'package:food_admin/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../../../../core/constantes/constantes.dart';

class LoginCenterContainer extends StatelessWidget {
  const LoginCenterContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);

    return Container(
      height: size.height * 0.34,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size.height * 0.01),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: loginProvider.formkey,
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
              SizedBox(
                height: size.height * 0.02,
              ),
              CustomLoginTextfield(
                hintext: "Email Id",
                icon: Icons.email,
                onChanged: (value) {
                  loginProvider.email = value;
                },
                validator: (value) {
                  return validateEmail(value);
                },
              ),
              CustomLoginTextfield(
                onChanged: (value) {
                  loginProvider.password = value;
                },
                hintext: "Password",
                icon: Icons.lock_rounded,
                validator: (value) {
                  return validatePassword(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
