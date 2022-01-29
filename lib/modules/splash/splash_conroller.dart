import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:project/config/user_information.dart';
import 'package:project/local_save/sceure_storage.dart';
import 'package:project/modules/splash/splash_service.dart';

class SplashController extends GetxController {
  late SceureStorage _storage;
  late bool validityToken;
  late SplashService _service;

  @override
  void onInit() async {
    validityToken = false;
    _service = SplashService();
    _storage = SceureStorage();
    await checkToken();
    super.onInit();
  }

  Future<void> checkToken() async {
    String? token = await _storage.read('token');
    if (token != null) {
      await validToken(token);
      if (validityToken) {
        UserInformation.USER_TOKEN = token;
        Get.offAllNamed('/HomePage');
      } else {
        EasyLoading.showError(_service.message);
        Get.offAllNamed('/Landing');
      }
    } else {
      Get.offNamed('/Landing');
    }
  }

  Future<void> validToken(String token) async {
    validityToken = await _service.checkValid(token);
  }
}
