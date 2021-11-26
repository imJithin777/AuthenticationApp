import 'package:authentication/app/controllers/auth/authController.dart';
import 'package:authentication/app/ui/screens/Auth/signIn_screen.dart';
import 'package:authentication/app/ui/themes/my_colors.dart';
import 'package:authentication/app/ui/themes/my_text_styles.dart';
import 'package:authentication/app/ui/widgets/CommonTextField.dart';
import 'package:authentication/app/ui/widgets/CommonsizedButton.dart';
import 'package:authentication/app/ui/widgets/common_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  final signUpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        initState: (state) {},
        builder: (con) {
          return CommonScaffold(
            resetBottom: true,
              child: SafeArea(
                  child: Container(
                      height: Get.height,
                      width: Get.width,
                      color: MyColors.white,
                      child: Center(
                          child: SingleChildScrollView(
                              child: Column(children: [
                                const SizedBox(
                                  height: 46,
                                ),
                                signUpModule(context),
                                const SizedBox(
                                  height: 25,
                                ),
                              ]))))));
        });
  }

  Widget signUpModule(context) {
    return  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: MyColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Form(
            key: signUpKey,
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text('welcome'.tr,style: MyTextStyles.welcometext,),
                  ],
                ),
                const SizedBox(
                  height: 17,
                ),

                Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Text(
                "signup_desc".tr,
                style: MyTextStyles.descriptiontext,
              ),
              ]),

                const SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, bottom: 10),
                      child: Text("name".tr, style: MyTextStyles.contentText),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: CommonTextField(
                      context: context,
                      controller: AuthController.to.name,
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
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "name_error_text_blank".tr;
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                    )),
                const  SizedBox(
                  height: 30,
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, bottom: 10),
                      child: Text("phone".tr, style: MyTextStyles.contentText),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: CommonTextField(
                      context: context,
                      controller: AuthController.to.phone,
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
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, bottom: 10),
                      child: Text("signEmail".tr, style: MyTextStyles.contentText),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: CommonTextField(
                      context: context,
                      controller: AuthController.to.signUpEmail,
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
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, bottom: 10),
                      child: Text(
                        "password".tr,
                        style:MyTextStyles.contentText,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: CommonTextField(
                    context: context,
                    controller: AuthController.to.signUpPassword,
                    password: true,
                    isdense: true,
                    maxLine: 1,
                    issuffix: true,
                    isSuggestions: true,
                    iconcolor: MyColors.grey,
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
                    hintText: 'E_pass'.tr,
                    hinttextstyle: MyTextStyles.hintstyle,
                    textstyle: MyTextStyles.labelstyle,
                    validator: (val) {

                      if (val!.isEmpty) {
                        return "password_empty_err".tr;
                      }else if (!AuthController.to.validateStructure(AuthController.to.signUpPassword.text)) {
                        return 'pass_invalid_err'.tr;
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                  ),
                ),

                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child:  CommonsizedButton(
                          isborderbutton: false,
                      height: 55,
                      width: Get.width - 70,
                      radius: 5,
                      style: MyTextStyles.commonbuttonstyle,
                      primarycolor: MyColors.kPrimaryColor,
                      elevation: 0.0,
                      onPressed: () {
                        final FormState form = signUpKey.currentState!;
                        if (form.validate()) {
                          AuthController.to.register();
                        }
                      },
                      istext: true,
                      title: "signup".tr,
                    ),

                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "already".tr,
                      style: MyTextStyles.contentText,
                    ),
                    InkWell(
                      child: Text(
                        "instead".tr,
                        style: MyTextStyles.create,
                      ),
                      onTap: () =>  Get.to(() => SignInScreen()),
                    )
                  ],
                ),

              ],
            ),
          ),
        ),
      );
  }
}
