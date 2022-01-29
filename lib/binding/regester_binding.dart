import 'package:get/get.dart';
import 'package:project/modules/regester/regester_controler.dart';

class RegesterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<RegesterControler>(RegesterControler());
  }
}
