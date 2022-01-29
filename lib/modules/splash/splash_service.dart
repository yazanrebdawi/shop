import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/config/server_config.dart';
import 'package:project/config/user_information.dart';
import 'package:project/local_save/sceure_storage.dart';

class SplashService {
  var message;

  var url = Uri.parse(Serverconfig.domaiNameServer + Serverconfig.login);

  Future<bool> checkValid(String token) async {
    SceureStorage storage = SceureStorage();

    var email = await storage.read('email');
    var password = await storage.read('password');
    var response = await http.post(
      url,
      headers: {'Accept': 'application/json'},
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      print("200 true");
      var jsonResponse = jsonDecode(response.body);

      token = jsonResponse['access_token'];
      UserInformation.USER_TOKEN = token;

      SceureStorage storage = SceureStorage();
      await storage.save('token', UserInformation.USER_TOKEN);

      return true;
    } else if (response.statusCode == 401) {
      return false;
    } else if (response.statusCode == 422) {
      return false;
    } else {
      return false;
    }
  }
}
