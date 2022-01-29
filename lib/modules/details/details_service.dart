import 'dart:convert';
import 'dart:io';

import 'package:project/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:project/config/user_information.dart';
import 'package:project/models/api_statues.dart';
import 'package:project/models/category.dart';
import 'package:project/models/prodact.dart';

class DetailServices {
  static var masseg;

  static Future<Object> getProduct(String token, String id) async {
    try {
      var uri = Uri.parse(
          Serverconfig.domaiNameServer + Serverconfig.get_productById + id);
      var response = await http.get(uri, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
      if (Serverconfig.SUCCESS == response.statusCode) {
        masseg = Success(response: response.body);
        return Product.fromJson(jsonDecode(response.body)["data"]);
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

  static Future<Object> getCategoryById(String id) async {
    try {
      String token = UserInformation.USER_TOKEN;
      var uri = Uri.parse(
          Serverconfig.domaiNameServer + Serverconfig.get_category + id);
      var response = await http.get(uri, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
      if (Serverconfig.SUCCESS == response.statusCode) {
        masseg = Success(response: response.body);
        return Category.fromJson(jsonDecode(response.body)["data"]);
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
