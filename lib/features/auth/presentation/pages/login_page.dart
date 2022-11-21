import 'package:flutter/material.dart';

import '../../../../core/util/size_util.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/custom_picture_container.dart';
import '../widgets/login_center_container.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/res.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.1),
              const CustomPictureContainer(),
              SizedBox(height: size.height * 0.04),
              const LoginCenterContainer(),
              SizedBox(height: size.height * 0.05),
              const CustomLoginButtom(),
            ],
          ),
        ),
      )),
    );
  }
}
