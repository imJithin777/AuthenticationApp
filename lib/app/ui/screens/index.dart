import 'package:authentication/app/controllers/common/CommonController.dart';
import 'package:authentication/app/ui/screens/Auth/signIn_screen.dart';
import 'package:authentication/app/ui/screens/Home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommonController>(
        init: CommonController(),
        initState: (state) {
        },
        builder: (controller) =>
        controller.isAppOpeningForFirstTime()
            ? SignInScreen()
            : HomeScreen());


  }
}


