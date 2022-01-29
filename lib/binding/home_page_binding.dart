import 'package:get/get.dart';
import 'package:project/modules/home_page/home_page_controler.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomePageControler>(HomePageControler());
  }
}
