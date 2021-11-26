import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void showSnackbar(title,message) {
  Flushbar(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
    margin: const EdgeInsets.all(15),
    borderRadius: const BorderRadius.all(Radius.circular(8)),
    backgroundGradient: const LinearGradient(
      colors: [Colors.black87, Colors.black],
      stops: [0.6, 1],
    ),
    flushbarPosition:FlushbarPosition.TOP,
    isDismissible: false,
   duration:const Duration(seconds: 2),
    boxShadows: const [
      BoxShadow(
        color: Colors.black45,
        offset: Offset(3, 3),
        blurRadius: 3,
      ),
    ],
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    // The default curve is Curves.easeOut
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    message: '$message',
  ).show(Get.context!);
}