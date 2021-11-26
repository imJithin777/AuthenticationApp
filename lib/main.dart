// import 'package:firebase_core/firebase_core.dart';
import 'package:authentication/app/translations/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/controllers/common/CommonController.dart';
import 'app/ui/screens/index.dart';
import 'app/ui/themes/app_theme.dart';
import 'app/ui/themes/my_colors.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(statusBarColor: MyColors.kPrimaryColor,),
  );

  runApp( GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    theme: appThemeData,
    defaultTransition: Transition.fade,
    locale:CommonController.to.getLocale(),
    translations: AppTranslations(),
    home: IndexPage(),
  ),);

}



