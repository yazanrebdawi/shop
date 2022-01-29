import 'package:get/get.dart';
import 'package:project/models/user.dart';
import 'package:project/modules/login/login_service.dart';

class LoginControler extends GetxController {
  var eMail;
  var password;
  var loginStatuse;
  var checkBoxStatus;
  late LoginService service;
  var massage;
  @override
  void onInit() {
    eMail = '';
    password = '';
    loginStatuse = false;
    checkBoxStatus = false.obs;
    service = LoginService();
    super.onInit();
  }

  void changeCheckBox() {
    checkBoxStatus(!checkBoxStatus.value);
  }

  Future<void> loginOnClick() async {
    User user = new User(
      email: eMail,
      password: password,
    );
    loginStatuse = await service.login(user, checkBoxStatus.value);
    massage = service.massage;
    if (massage is List) {
      String temp = '';
      for (String s in massage) {
        temp = s + '\n';
        massage = temp;
      }
    }
  }
}
