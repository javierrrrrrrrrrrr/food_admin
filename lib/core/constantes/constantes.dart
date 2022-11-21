import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

const String apiUrl = 'http://66.94.96.169:3001/';

const Color kprymaricolor = Color.fromRGBO(255, 109, 0, 1);

dynamic loadingSpinner(context) {
  final size = MediaQuery.of(context).size;
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Center(
            child: Lottie.asset("assets/loading.json",
                height: size.height * 0.4, width: size.width * 0.4));
      });
}
