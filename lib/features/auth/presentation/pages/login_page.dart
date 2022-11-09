import 'package:flutter/material.dart';

import '../widgets/custom_buttom.dart';
import '../widgets/custom_picture_container.dart';
import '../widgets/login_center_container.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
          child: Stack(
            children: [
              Positioned(
                right: size.width * 0.0001,
                top: size.height * 0.13,
                child: const CustomPictureContainer(),
              ),
              Positioned(
                top: size.height * 0.48,
                child: const LoginCenterContainer(),
              ),
              Positioned(
                bottom: size.height * 0.08,
                child: const CustomLoginButtom(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
