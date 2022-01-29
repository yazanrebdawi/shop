// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constant.dart';
import 'package:project/modules/splash/splash_conroller.dart';

class Splash extends StatelessWidget {
  SplashController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: gradientBackground,
          child: SizedBox(
            height: 180,
            width: 180,
            child: CircleAvatar(
              backgroundColor: white,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
