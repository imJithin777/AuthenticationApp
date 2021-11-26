import 'package:another_flushbar/flushbar.dart';
import 'package:authentication/app/ui/widgets/CommonsizedButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertBox {

}
void showSnackbar(title,message) {
  Flushbar(
    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
    margin: EdgeInsets.all(15),
    borderRadius: BorderRadius.all(Radius.circular(8)),
    backgroundGradient: const LinearGradient(
      colors: [Colors.black87, Colors.black],
      stops: [0.6, 1],
    ),
    flushbarPosition:FlushbarPosition.TOP,
    isDismissible: false,
   duration:Duration(seconds: 2),
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