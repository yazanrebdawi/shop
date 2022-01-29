import 'package:get/get.dart';
import 'package:project/models/user.dart';
import 'package:project/modules/regester/regester_service.dart';

class RegesterControler extends GetxController {
  var fullName = '';
  var eMail = '';
  var password = '';
  var age = 0;
  var phone = '';
  var confirmPassword = '';
  var regesterStatuse = false;
  RegesterService regestre = RegesterService();
  var massage;
  Future<void> regesterOnClick() async {
    User user = new User(
      name: fullName,
      email: eMail,
      age: age,
      password: password,
      phone: phone,
      confirmPassword: confirmPassword,
    );
    regesterStatuse = await regestre.regester(user);
    massage = regestre.massage;
    if (massage is List) {
      String temp = '';
      for (String s in massage) {
        temp = s + '\n';
        massage = temp;
      }
    }
  }
}
