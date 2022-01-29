import 'package:get/get.dart';
import 'package:project/modules/splash/splash_conroller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
