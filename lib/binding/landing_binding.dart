import 'package:get/get.dart';
import 'package:project/modules/landing/landing_controler.dart';

class LandingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LandingControler>(LandingControler());
  }
}
