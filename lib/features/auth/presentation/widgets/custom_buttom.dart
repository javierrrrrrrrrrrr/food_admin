import 'package:flutter/material.dart';
import 'package:food_admin/features/auth/presentation/Providers/login_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/constantes/constantes.dart';
import '../../../main_components/pages/control_page.dart';

class CustomLoginButtom extends StatelessWidget {
  const CustomLoginButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
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
        onPressed: () async {
          if (loginProvider.isValidForm()) {
            loadingSpinner(context);
            bool repsuesta = await loginProvider.loginUser(
                email: loginProvider.email, password: loginProvider.password);

            if (repsuesta == true) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ControlPage(),
                  ));
            } else {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(loginProvider.error),
                  duration: const Duration(seconds: 2),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }

          // bool respuesta = await loginProvider.loginUser();
          // if (respuesta == true) {
          //   // ignore: use_build_context_synchronously
          //
          // } else {
          //   Navigator.pop(context);
          //   //error
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(
          //       content: Text(loginProvider.error!),
          //       duration: const Duration(seconds: 2),
          //       backgroundColor: Colors.red,
          //     ),
          //   );
          // }

          //timer 5 segundos
        },
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
