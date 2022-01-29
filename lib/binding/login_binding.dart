import 'package:get/get.dart';
import 'package:project/modules/login/login_controler.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginControler>(LoginControler());
  }
}
