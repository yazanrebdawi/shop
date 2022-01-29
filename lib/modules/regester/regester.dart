// ignore_for_file: must_be_immutable, dead_code

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:project/compenet/coustome_button.dart';
import 'package:project/compenet/coustome_text_filde.dart';
import 'package:project/constant.dart';
import 'package:project/modules/regester/regester_controler.dart';

class Regester extends StatelessWidget {
  RegesterControler controler = Get.find();

  Regester({Key? key}) : super(key: key);

  onClickRegester() async {
    EasyLoading.instance..loadingStyle = EasyLoadingStyle.light;
    EasyLoading.show(status: 'loading...');
    await controler.regesterOnClick();
    if (controler.regesterStatuse) {
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
          decoration: gradientBackground,
          child: ListView(children: [
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
            const SizedBox(
              height: 30,
            ),
            Column(children: [
              CoustumeTextFilde(
                icon: Icon(
                  Icons.person,
                  color: white,
                ),
                hight: 60,
                width: MediaQuery.of(context).size.width * 0.95,
                hinttext: 'User Name',
                keybord: TextInputType.name,
                onChange: (Value) {
                  controler.fullName = Value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CoustumeTextFilde(
                icon: Icon(
                  Icons.email,
                  color: white,
                ),
                hight: 60,
                width: MediaQuery.of(context).size.width * 0.95,
                hinttext: 'E-Mail',
                keybord: TextInputType.emailAddress,
                onChange: (Value) {
                  controler.eMail = Value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CoustumeTextFilde(
                icon: Icon(
                  Icons.app_registration_outlined,
                  color: white,
                ),
                hight: 60,
                width: MediaQuery.of(context).size.width * 0.95,
                hinttext: 'Age',
                keybord: TextInputType.number,
                onChange: (Value) {
                  controler.age = int.parse(Value);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CoustumeTextFilde(
                icon: Icon(
                  Icons.password_outlined,
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
              const SizedBox(
                height: 30,
              ),
              CoustumeTextFilde(
                icon: Icon(
                  Icons.password_outlined,
                  color: white,
                ),
                hight: 60,
                width: MediaQuery.of(context).size.width * 0.95,
                hinttext: 'ConfirmPassword',
                keybord: TextInputType.visiblePassword,
                onChange: (Value) {
                  controler.confirmPassword = Value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CoustumeTextFilde(
                icon: Icon(
                  Icons.phone,
                  color: white,
                ),
                hight: 60,
                width: MediaQuery.of(context).size.width * 0.95,
                hinttext: 'phone',
                keybord: TextInputType.phone,
                onChange: (Value) {
                  controler.phone = Value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CoustemBoutton(
                  hight: 60,
                  width: MediaQuery.of(context).size.width * 0.87,
                  bouttonName: 'Sing Up',
                  onTap: () {
                    onClickRegester();
                  }),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Alredy have an account ?',
                        style: TextStyle(
                          fontSize: 20,
                          color: white,
                        )),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/Login');
                      },
                      child: Text('Sing In',
                          style: TextStyle(
                              fontSize: 20,
                              color: white,
                              decoration: TextDecoration.underline)),
                    )
                  ],
                ),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
