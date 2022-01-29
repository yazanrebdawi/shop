import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project/config/server_config.dart';
import 'package:project/config/user_information.dart';
import 'package:project/models/api_statues.dart';
import 'package:project/models/category.dart';
import 'package:project/models/prodact.dart';

class AddProductService {
  var massage;

  Future<void> addProduct(Product prodact) async {
    var uri =
        Uri.parse(Serverconfig.domaiNameServer + Serverconfig.add_prodact);
    String token = UserInformation.USER_TOKEN;

    var response = await http.post(
      uri,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {
        'name': prodact.name,
        "price": prodact.price.toString(),
        "description": prodact.description,
        "exp_data": prodact.expData,
        "img_url": prodact.imgUrl,
        "quantity": prodact.quantity.toString(),
        "category_id": prodact.categoryId.toString(),
        "list_discounts": ListDiscountToJson(prodact.listDiscounts!)
      },
    );
    print(response.body.toString());
    // if (response.statusCode == 200) {
    //   var jsonResponse = jsonDecode(response.body);
    //   massage = jsonResponse['msg'];
    //   return true;
    // } else if (response.statusCode == 401) {
    //   var jsonResponse = jsonDecode(response.body);
    //   massage = jsonResponse['error'];
    //   return false;
    // } else if (response.statusCode == 422) {
    //   var jsonResponse = jsonDecode(response.body);
    //   massage = jsonResponse['errors'];
    //   return false;
    // } else {
    //   massage = 'server erorr';
    //return false;
    // }
  }

  Future<Object> getCategory() async {
    try {
      String token = UserInformation.USER_TOKEN;
      var uri =
          Uri.parse(Serverconfig.domaiNameServer + Serverconfig.get_categorys);
      var response = await http.get(uri, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
      if (Serverconfig.SUCCESS == response.statusCode) {
        return Success(response: categoryFromJson(response.body));
      }
      return Failure(
          code: Serverconfig.INVALID_RESPONSE,
          errorResponse: 'invalid Response');
    } on HttpException {
      return Failure(
          code: Serverconfig.No_INTERNET, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(
          code: Serverconfig.INVALID_FORMAT, errorResponse: 'invalid Format');
    } catch (e) {
      return Failure(
          code: Serverconfig.UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
