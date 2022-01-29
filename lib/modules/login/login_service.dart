import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project/config/server_config.dart';
import 'package:project/config/user_information.dart';
import 'package:project/local_save/sceure_storage.dart';
import 'package:project/models/api_statues.dart';
import 'package:project/models/user.dart';

class LoginService {
  var massage;
  var token;
  var uri = Uri.parse(Serverconfig.domaiNameServer + Serverconfig.login);
  Future<bool> login(User user, bool chechBox) async {
    var response = await http.post(
      uri,
      headers: {'Accept': 'application/json'},
      body: {
        'email': user.email,
        'password': user.password,
      },
    );
    if (response.statusCode == 200) {
      print("200 true");
      var jsonResponse = jsonDecode(response.body);
      //massage = jsonResponse['msg'];
      massage = "login success";
      token = jsonResponse['access_token'];
      UserInformation.USER_TOKEN = token;
      if (chechBox) {
        SceureStorage storage = SceureStorage();
        await storage.save('token', UserInformation.USER_TOKEN);
        await storage.save('email', user.email.toString());
        await storage.save('password', user.password.toString());
      }
      return true;
    } else if (response.statusCode == 401) {
      var jsonResponse = jsonDecode(response.body);
      //massage = jsonResponse['error'];
      massage = "falier";
      return false;
    } else if (response.statusCode == 422) {
      var jsonResponse = jsonDecode(response.body);
      massage = jsonResponse['errors'];
      return false;
    } else {
      massage = 'server erorr';
      return false;
    }
  }

  Future<Object> getUser(String token) async {
    try {
      var uri = Uri.parse(Serverconfig.domaiNameServer + Serverconfig.get_User);
      var response = await http.get(uri, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
      if (Serverconfig.SUCCESS == response.statusCode) {
        massage = Success(response: response.body);
        return User.fromJson(jsonDecode(response.body));
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
