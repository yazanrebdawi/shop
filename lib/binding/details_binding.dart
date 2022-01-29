import 'package:get/get.dart';
import 'package:project/modules/details/details_controller.dart';

class DetailsPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DetailController>(DetailController());
  }
}
