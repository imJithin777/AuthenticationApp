import 'dart:async';

import 'package:authentication/app/config/globals.dart';
import 'package:authentication/app/controllers/common/CommonController.dart';
import 'package:authentication/app/ui/screens/Home/homeScreen.dart';
import 'package:authentication/app/ui/screens/index.dart';
import 'package:authentication/app/ui/widgets/alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.put<AuthController>(AuthController());

  final box = GetStorage();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  TextEditingController phone = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController name = TextEditingController();


  init() {
    email.text = '';
    password.text = '';
    signUpEmail.text = '';
    signUpPassword.text = '';
    name.text = '';
    phone.text = '';
  }

 // Check Phone Validation
  bool validateStructure(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[.!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  // Signin Function
  Future<dynamic> login() async {
    print("datas: ${box.read(Globals.CUSTOMERDATAS)}");
    if (box.read(Globals.CUSTOMERDATAS) != null){
      CommonController.to.CustomerDatas = box.read(Globals.CUSTOMERDATAS);
      var product = CommonController.to.CustomerDatas.firstWhere((data) => data['email'] == email.text && data['password'] == password.text, orElse: () => null);
      if (product == null){
        showSnackbar("", "Invalid Email or Password");
      }else{
        CommonController.to.ProfileData = product;
        box.write(Globals.CURRENTCUSTOMERDATA, CommonController.to.ProfileData);
        box.write(Globals.IS_LOGIN, true);
        showSnackbar("", "Login Successfull");
        Future.delayed(const Duration(milliseconds: 800), () {
          Get.to(()=> HomeScreen());
          init();
        });
      }
      // CommonController.to.CustomerDatas.forEach((data){
      //   if (data['email'] == email.text && data['password'] == password.text){
      //     CommonController.to.ProfileData = data;
      //     box.write(Globals.CURRENTCUSTOMERDATA, CommonController.to.ProfileData);
      //     box.write(Globals.IS_LOGIN, true);
      //     showSnackbar("", "Login Successfull");
      //     Future.delayed(const Duration(milliseconds: 800), () {
      //       Get.to(()=> HomeScreen());
      //       init();
      //     });
      //   }else{
      //     showSnackbar("", "Invalid Email or Password");
      //   }
      // });
    }else{
      showSnackbar("", "Invalid Email or Password");
    }

  }


 // Signup Function
  Future<dynamic> register() async {
    CommonController.to.ProfileData = {"name": name.text, "email": signUpEmail.text, "phone": phone.text, "password": signUpPassword.text};
    if (box.read(Globals.CUSTOMERDATAS) != null){
      CommonController.to.CustomerDatas = box.read(Globals.CUSTOMERDATAS);
      CommonController.to.CustomerDatas.forEach((data){
        if (data['email'] == signUpEmail.text){
          showSnackbar("", "Emailid Already Exists");
        }else{
          CommonController.to.CustomerDatas.add(CommonController.to.ProfileData);
          box.write(Globals.CURRENTCUSTOMERDATA, CommonController.to.ProfileData);
          box.write(Globals.CUSTOMERDATAS, CommonController.to.CustomerDatas);
          box.write(Globals.IS_LOGIN, true);
          showSnackbar("", "Registration Successfull");
          Future.delayed(const Duration(milliseconds: 800), () {
            Get.to(()=> HomeScreen());
            init();
          });

        }
      });
    }else{
      CommonController.to.CustomerDatas.add(CommonController.to.ProfileData);
      box.write(Globals.CURRENTCUSTOMERDATA, CommonController.to.ProfileData);
      box.write(Globals.CUSTOMERDATAS, CommonController.to.CustomerDatas);
      box.write(Globals.IS_LOGIN, true);
      showSnackbar("", "Registration Successfull");
      Future.delayed(const Duration(milliseconds: 800), () {
        Get.to(()=> HomeScreen());
        init();
      });
    }


  }



}
