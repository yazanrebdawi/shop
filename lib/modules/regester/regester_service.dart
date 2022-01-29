import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/config/server_config.dart';
import 'package:project/config/user_information.dart';
import 'package:project/models/user.dart';

class RegesterService {
  var massage;
  var uri = Uri.parse(Serverconfig.domaiNameServer + Serverconfig.regester);
  Future<bool> regester(User user) async {
    var response = await http.post(
      uri,
      headers: {'Accept': 'application/json'},
      body: {
        'name': user.name,
        'email': user.email,
        'age': user.age.toString(),
        'password': user.password,
        'phone': user.phone,
        'password_confirmation': user.confirmPassword,
      },
    );
    if (response.statusCode == 200) {
      print("200 true");
      var jsonResponse = jsonDecode(response.body);

      massage = "create  success";
      String token = jsonResponse['access_token'];
      UserInformation.USER_TOKEN = token;
      return true;
    } else if (response.statusCode == 401) {
      massage = "falier";
      return false;
    } else if (response.statusCode == 422) {
      massage = "falier";

      return false;
    } else {
      massage = 'server erorr';
      print(response.body);
      return false;
    }
  }
}
