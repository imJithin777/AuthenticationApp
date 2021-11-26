

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:authentication/app/config/globals.dart';

class CommonController extends GetxController {
  final box = GetStorage();
  static CommonController get to=>Get.put<CommonController>(CommonController());


  @override
  void onInit() {
    super.onInit();
  }


  var _CustomerDatas = <dynamic>[].obs;

  get CustomerDatas => _CustomerDatas.value;

  set CustomerDatas(value) {
    _CustomerDatas.value = value;
  }

  var _ProfileData = Map().obs;

  get ProfileData => _ProfileData.value;

  set ProfileData(value) {
    _ProfileData.value = value;
  }

  bool isAppOpeningForFirstTime() {
    var isAppOpeningFirstTime = box.read(Globals.IS_LOGIN);
    if (isAppOpeningFirstTime == null) box.write(Globals.IS_LOGIN, false);
    return (isAppOpeningFirstTime == null || isAppOpeningFirstTime == false) ? true : false;
  }

  Locale getLocale() {
    var language = box.read(Globals.LANGUAGE);
    String country="";
    switch(language){
      case "en":
        country="US";
        break;
      case "ar":
        country="AE";
        break;
    }
    return (language == null) ? Locale("en","US"): Locale("$language","$country");
  }

}
