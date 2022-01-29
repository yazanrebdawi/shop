// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/compenet/coustome_button.dart';
import 'package:project/constant.dart';
import 'package:project/modules/landing/landing_controler.dart';

class Landing extends StatelessWidget {
  Landing({Key? key}) : super(key: key);

  LandingControler controler = Get.find();
  void loginGo() {
    controler.goLogin();
  }

  void regesterGo() {
    controler.goRegester();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: gradientBackground,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
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
            const Text('Welcom',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                )),
            const SizedBox(
              height: 150,
            ),
            CoustemBoutton(
              hight: 60,
              width: MediaQuery.of(context).size.width * 0.85,
              bouttonName: 'Sing In',
              bouttonColer: white,
              textBouttonColor: black,
              textBouttonSize: 30,
              onTap: () {
                loginGo();
              },
            ),
            const SizedBox(
              height: 25,
            ),
            CoustemBoutton(
              hight: 60,
              width: MediaQuery.of(context).size.width * 0.85,
              bouttonName: 'Sing Up',
              bouttonColer: white,
              textBouttonColor: black,
              textBouttonSize: 30,
              onTap: () {
                regesterGo();
              },
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    ));
  }
}
