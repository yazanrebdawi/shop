import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project/config/user_information.dart';
import 'package:project/models/api_statues.dart';

import 'package:project/models/prodact.dart';
import 'package:get/get.dart';

import 'home_page_service.dart';

class HomePageControler extends GetxController {
  List<Product> _productList = [];
  bool _loading = false;

  List<Product> get productList => _productList;

  @override
  void onInit() {
    getProduct();

    super.onInit();
  }

  setLoading(bool loading) async {
    _loading = loading;
    update();
  }

  setProductListModel(List<Product> prodtList) {
    _productList = prodtList;
    update();
  }

  getProduct() async {
    setLoading(true);
    var response = await HomePageService.getProduct(UserInformation.USER_TOKEN);

    if (HomePageService.masseg is Success) {
      setProductListModel(response as List<Product>);
    }
    if (response is Failure) {
      EasyLoading.showError(response.errorResponse.toString(),
          duration: Duration(seconds: 4), dismissOnTap: true);
    }
    setLoading(false);
  }
}
