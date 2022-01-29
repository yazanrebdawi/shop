import 'dart:io';

import 'package:project/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:project/models/api_statues.dart';
import 'package:project/models/prodact.dart';

class HomePageService {
  static var masseg;

  static Future<Object> getProduct(String token) async {
    try {
      var uri =
          Uri.parse(Serverconfig.domaiNameServer + Serverconfig.get_prodact);
      var response = await http.get(uri, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
      if (Serverconfig.SUCCESS == response.statusCode) {
        masseg = Success(response: response.body);
        return productFromJson(response.body);
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
