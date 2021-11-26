import 'package:authentication/app/controllers/common/CommonController.dart';
import 'package:authentication/app/controllers/home/homeController.dart';
import 'package:authentication/app/ui/themes/my_colors.dart';
import 'package:authentication/app/ui/themes/my_text_styles.dart';
import 'package:authentication/app/ui/widgets/CommonTextField.dart';
import 'package:authentication/app/ui/widgets/CommonsizedButton.dart';
import 'package:authentication/app/ui/widgets/common_scaffold.dart';
import 'package:authentication/app/ui/widgets/profileicon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        initState: (state) {
          HomeController.to.getCustomerData();
        },
        builder: (con) {
          return CommonScaffold(
            resetBottom: true,
            child: SafeArea(
              child: Container(
                height: Get.height,
                width: Get.width,
                color: MyColors.white,
                child: SingleChildScrollView(
                    physics:  const ClampingScrollPhysics(),
                    child: Container(
                      margin: const EdgeInsets.only( bottom: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(height: 0,),
                          profilePic(),
                          editButton(),
                          Obx(()=> HomeController.to.iseditEnabled == true
                              ? allFieldsEditable(context) : allFields() ),

                        ],
                      ),
                    )
                ),
              ),
            ),

          );
        }
    );
  }

  Widget profilePic(){
    return Container(
      height: 250,
        alignment: Alignment.center,
        width: Get.width,
        decoration: const BoxDecoration(
            color: MyColors.kPrimaryColor,
            borderRadius: BorderRadius.only(topRight: Radius.circular(0), topLeft: Radius.circular(0))
        ),
        child: Stack(
          children: [

            Center(
              child: profileImage(radius: 12),),


            Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Align(
                  alignment: Alignment.topRight,
                  child: CommonsizedButton(
                    isborderbutton: false,
                    height: 55,
                    width: 90,
                    radius: 5,
                    style: MyTextStyles.commonbuttonstyle,
                    primarycolor: Colors.transparent,
                    elevation: 0.0,
                    onPressed: () {
                      HomeController.to.logout();
                    },
                    istext: true,
                    title: "logout".tr,
                  ),))


          ],
        )
    );
  }

  Widget editButton(){
    return  Obx(()=> Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: Alignment.center,
        child: CommonsizedButton(
          isborderbutton: false,
          height: 45,
          width: 100,
          radius: 5,
          style: MyTextStyles.commonbuttonstyle,
          primarycolor: MyColors.kPrimaryColor,
          elevation: 0.0,
          onPressed: () {
            if (HomeController.to.iseditEnabled){
              HomeController.to.iseditEnabled = false;
              HomeController.to.saveChanges();
            }else{
              HomeController.to.iseditEnabled = true;
            }
          },
          istext: true,
          title: HomeController.to.iseditEnabled == true ? "save".tr : "edit".tr,
        ), ),
    ));
  }

  Widget allFields(){
    return Container(
      decoration: const BoxDecoration(
        color: MyColors.white,
        // borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
      ),

      child: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20, bottom: 10),
          child:Padding(padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 00),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                const SizedBox(height: 20,),
                Row(
                  children: [
                    Text("name".tr,style: MyTextStyles.contentText),
                  ],
                ),
                const SizedBox(height: 10,),
                Padding(
                    padding: const EdgeInsets.only(left:0.0,right: 0),
                    child: Container(
                      padding: const EdgeInsets.only(top: 15,left: 20),
                      width: Get.width,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: MyColors.kCardBackgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      child: Obx(()=>  Text(
                        "${CommonController.to.ProfileData['name']}",
                        style: MyTextStyles.labelstyle,
                      ),)
                    )),
                const SizedBox(height: 25,),
                Row(
                  children:  [
                    Text("signEmail".tr,style: MyTextStyles.contentText),
                  ],
                ),
                const SizedBox(height: 10,),
                Padding(
                    padding: const EdgeInsets.only(left:0.0,right: 0),
                    child:Container(
                      padding: const EdgeInsets.only(top: 15,left: 20),
                      width: Get.width,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: MyColors.kCardBackgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      child:  Text(
                        "${CommonController.to.ProfileData['email']}",
                        style: MyTextStyles.labelstyle,
                      ),
                    )
                ),
                const SizedBox(height: 25,),
                Row(
                  children:  [
                    Text("phone".tr,style: MyTextStyles. contentText),
                  ],
                ),
                const SizedBox(height: 10,),
                Padding(
                    padding: const EdgeInsets.only(left:0.0,right: 0),
                    child: Container(
                      padding: const EdgeInsets.only(top: 15,left: 20),
                      width: Get.width,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: MyColors.kCardBackgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      child:  Text(
                        "${CommonController.to.ProfileData['phone']}",
                        style: MyTextStyles.labelstyle,
                      ),
                    )),

                const SizedBox(height: 20,),



              ],
            ),
          )
      ),
    );
  }


  Widget allFieldsEditable(context) {
    return Container(
      decoration: const BoxDecoration(
        color: MyColors.white,
      ),
      child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 5),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("name".tr, style: MyTextStyles.contentText),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 0.0, right: 0),
                    child: CommonTextField(
                      context: context,
                      controller: HomeController.to.name,
                      password: false,
                      isdense: true,
                      issuffix: false,
                      isSuggestions: true,
                      textfieldpadding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
                      enableborder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: MyColors.textborder),
                      ),
                      focusborder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: MyColors.kPrimaryColor, width: 1.5)),
                      focuserrorborder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: MyColors.kPrimaryColor),
                      ),
                      errorborder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      hintText: 'E_name'.tr,
                      hinttextstyle: MyTextStyles.hintstyle,
                      textstyle: MyTextStyles.labelstyle,
                      onSaved: (value) {
                        HomeController.to.name.text = value;
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "name_error_text_blank".tr;
                        } else {
                          return null;
                        }
                      },
                    )),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                     Text("signEmail".tr, style: MyTextStyles.contentText),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 0.0, right: 0),
                    child: CommonTextField(
                      context: context,
                      controller: HomeController.to.email,
                      password: false,
                      isdense: true,
                      issuffix: false,
                      isSuggestions: true,
                      textfieldpadding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
                      enableborder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: MyColors.textborder),
                      ),
                      focusborder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: MyColors.kPrimaryColor, width: 1.5)),
                      focuserrorborder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: MyColors.kPrimaryColor),
                      ),
                      errorborder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      hintText: 'E_email'.tr,
                      hinttextstyle: MyTextStyles.hintstyle,
                      textstyle: MyTextStyles.labelstyle,
                      onSaved: (value) {
                        HomeController.to.email.text = value;
                      },
                      validator: (val) {

                        if (val!.isEmpty) {
                          return "email_empty_err".tr;
                        } else if (RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val) ==
                            false) {
                          return "email_invalid_err".tr;
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                    )),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text("phone".tr, style: MyTextStyles.contentText),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 0.0, right: 0),
                    child: CommonTextField(
                      context: context,
                      controller: HomeController.to.phone,
                      password: false,
                      isdense: true,
                      issuffix: false,
                      isSuggestions: true,
                      textfieldpadding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
                      enableborder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: MyColors.textborder),
                      ),
                      focusborder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: MyColors.kPrimaryColor, width: 1.5)),
                      focuserrorborder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: MyColors.kPrimaryColor),
                      ),
                      errorborder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      hintText: 'E_phone'.tr,
                      hinttextstyle: MyTextStyles.hintstyle,
                      textstyle: MyTextStyles.labelstyle,
                      onSaved: (value) {
                        HomeController.to.phone.text = value;
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "phone_empty_err".tr;
                        } else if (RegExp(
                            r'(^\+?91[0-9]{10}$)')
                            .hasMatch(val) ==
                            false) {
                          return "phone_invalid_err".tr;
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.phone,
                    )),
              ],
            ),
          )),
    );
  }

}


