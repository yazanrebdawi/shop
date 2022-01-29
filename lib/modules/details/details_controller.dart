import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:project/config/user_information.dart';
import 'package:project/models/api_statues.dart';
import 'package:project/models/category.dart';
import 'package:project/models/prodact.dart';
import 'package:project/modules/details/details_service.dart';
import 'package:project/modules/login/login_service.dart';

class DetailController extends GetxController {
  bool _loading = false;
  Product product = new Product();
  late LoginService service;

  Category category = new Category();
  String id = '0';
  @override
  void onInit() {
    service = new LoginService();
    id = Get.arguments['id'].toString();

    getProduct();
    super.onInit();
  }

  bool getloading() {
    return _loading;
    update();
  }

  setLoading(bool loading) async {
    _loading = loading;
    update();
  }

  getProduct() async {
    setLoading(true);
    var response =
        await DetailServices.getProduct(UserInformation.USER_TOKEN, id);

    if (DetailServices.masseg is Success) {
      product = response as Product;
      getCategoryByID(product.categoryId.toString());
    }
    if (response is Failure) {
      EasyLoading.showError(response.errorResponse.toString(),
          duration: Duration(seconds: 4), dismissOnTap: true);
    }
    setLoading(false);
    update();
  }

  getUser() async {
    setLoading(true);
    var response = await service.getUser(UserInformation.USER_TOKEN);

    if (DetailServices.masseg is Success) {
      product = response as Product;
      print(product.name);
    }
    if (response is Failure) {
      EasyLoading.showError(response.errorResponse.toString(),
          duration: Duration(seconds: 4), dismissOnTap: true);
    }
    setLoading(false);
    update();
  }

  getCategoryByID(String id) async {
    setLoading(true);
    var response = await DetailServices.getCategoryById(id);

    if (DetailServices.masseg is Success) {
      category = response as Category;
    }
    if (response is Failure) {
      EasyLoading.showError(response.errorResponse.toString(),
          duration: Duration(seconds: 4), dismissOnTap: true);
    }
    setLoading(false);
    update();
  }
}
