import 'package:authentication/app/controllers/common/CommonController.dart';
import 'package:authentication/app/ui/screens/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:authentication/app/config/globals.dart';

class HomeController extends GetxController {
  final box = GetStorage();

  static HomeController get to => Get.put<HomeController>(HomeController());

  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();

  var _iseditEnabled = false.obs;

  get iseditEnabled => _iseditEnabled.value;

  set iseditEnabled(value) {
    _iseditEnabled.value = value;
  }

  /// Fetch loggedin customer data function **/
  getCustomerData(){
    CommonController.to.ProfileData = box.read(Globals.CURRENTCUSTOMERDATA);
    phone.text = CommonController.to.ProfileData["phone"];
    email.text = CommonController.to.ProfileData["email"];
    name.text = CommonController.to.ProfileData["name"];
    print("datas: ${CommonController.to.ProfileData}");
  }

  /// Save edited changes function **/
  saveChanges(){
    var changedData = {"name": name.text, "email": email.text, "phone": phone.text, "password": CommonController.to.ProfileData["password"]};
    CommonController.to.ProfileData = changedData;
    CommonController.to.CustomerDatas.removeWhere((item)=>item['password'] == CommonController.to.ProfileData["password"]);
    CommonController.to.CustomerDatas.add(CommonController.to.ProfileData);
    print("datas: ${CommonController.to.CustomerDatas}");
    box.write(Globals.CURRENTCUSTOMERDATA, CommonController.to.ProfileData);
    box.write(Globals.CUSTOMERDATAS, CommonController.to.CustomerDatas);

  }

  /// Logout function **/
  logout(){
    box.write(Globals.IS_LOGIN, false);
    box.remove(Globals.CURRENTCUSTOMERDATA);
    Get.off(IndexPage());
  }

}