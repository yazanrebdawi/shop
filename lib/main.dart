import 'package:flutter/material.dart' show runApp;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:project/binding/add_prodact_binding.dart';
import 'package:project/binding/home_page_binding.dart';
import 'package:project/binding/landing_binding.dart';
import 'package:project/binding/login_binding.dart';
import 'package:project/binding/regester_binding.dart';
import 'package:project/binding/splash_binding.dart';
import 'package:project/modules/add_prodact/add_prodact.dart';
import 'package:project/modules/home_page/home_page.dart';
import 'package:project/modules/landing/landing.dart';
import 'package:project/modules/login/login.dart';
import 'package:project/modules/regester/regester.dart';
import 'package:project/modules/splash/splash.dart';
import 'binding/details_binding.dart';
import 'modules/details/details.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/Splash',
      getPages: [
        GetPage(
          name: '/Landing',
          page: () => Landing(),
          binding: LandingBinding(),
        ),
        GetPage(
          name: '/Login',
          page: () => Login(),
          binding: LoginBinding(),
        ),
        GetPage(
            name: '/Regester',
            page: () => Regester(),
            binding: RegesterBinding()),
        GetPage(
            name: '/HomePage',
            page: () => HomePage(),
            binding: HomePageBinding()),
        GetPage(
            name: '/AddProdect',
            page: () => AddProdact(),
            binding: AddProdactBinding()),
        GetPage(
            name: '/Splash', page: () => Splash(), binding: SplashBinding()),
        GetPage(
            name: '/Details',
            page: () => ProductDetail(),
            binding: DetailsPageBinding()),
      ],
      builder: EasyLoading.init(),
    ),
  );
}
