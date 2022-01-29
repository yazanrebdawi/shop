// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:project/compenet/coustome_button.dart';
import 'package:project/compenet/coustome_checkbox.dart';
import 'package:project/compenet/coustome_text_filde.dart';
import 'package:project/constant.dart';
import 'package:project/modules/login/login_controler.dart';

class Login extends StatelessWidget {
  LoginControler controler = Get.find();
  onClickLogin() async {
    EasyLoading.instance..loadingStyle = EasyLoadingStyle.light;
    EasyLoading.show(status: 'loading...');
    await controler.loginOnClick();
    if (controler.loginStatuse) {
      EasyLoading.showSuccess(controler.massage);
      Get.offAllNamed('/HomePage');
    } else {
      EasyLoading.showError(controler.massage,
          duration: Duration(seconds: 2), dismissOnTap: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: gradientBackground,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 215,
                  width: 215,
                  child: CircleAvatar(
                    backgroundColor: white,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .9,
                  child: Column(
                    children: [
                      CoustumeTextFilde(
                        icon: Icon(
                          Icons.email,
                          color: white,
                        ),
                        hight: 60,
                        width: MediaQuery.of(context).size.width * 0.95,
                        hinttext: 'E-mail',
                        keybord: TextInputType.emailAddress,
                        onChange: (Value) {
                          controler.eMail = Value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CoustumeTextFilde(
                        icon: Icon(
                          Icons.password,
                          color: white,
                        ),
                        hight: 60,
                        width: MediaQuery.of(context).size.width * 0.95,
                        hinttext: 'Password',
                        keybord: TextInputType.visiblePassword,
                        onChange: (Value) {
                          controler.password = Value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Obx(() {
                              return CustomCheckbox(
                                size: 25,
                                iconSize: 20,
                                isSelected: controler.checkBoxStatus.value,
                                onTap: () {
                                  controler.changeCheckBox();
                                },
                              );
                            }),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "keep me sign in",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Acaslon Regular",
                                  color: white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Center(
                    child: Text(
                      'Forgot Your Password?',
                      style: TextStyle(
                          fontSize: 17,
                          color: white,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .9,
                  child: Column(
                    children: [
                      CoustemBoutton(
                          hight: 60,
                          width: MediaQuery.of(context).size.width * 0.87,
                          bouttonName: 'Sing In',
                          onTap: () {
                            onClickLogin();
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                          fontSize: 17,
                          color: white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/Regester');
                        },
                        child: Text(
                          'Create one',
                          style: TextStyle(
                              fontFamily: 'Acaslon Regular',
                              fontSize: 17,
                              color: white,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
