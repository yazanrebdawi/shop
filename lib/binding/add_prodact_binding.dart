import 'package:get/get.dart';
import 'package:project/modules/add_prodact/add_prodact_controler.dart';

class AddProdactBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AddProdactControler>(AddProdactControler());
  }
}
