import 'package:get/get.dart';

class LandingControler extends GetxController {
  void goLogin() {
    Get.toNamed('/Login');
  }

  void goRegester() {
    Get.toNamed('/Regester');
  }
}
