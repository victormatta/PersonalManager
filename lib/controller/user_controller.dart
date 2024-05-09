import 'package:get/get.dart';
import 'package:personal_manager/model/user.dart';

class UserController extends GetxController {
  RxBool userIsReal = false.obs;
  var user = User().obs;

  void createUser(User pUser) {
    userIsReal.value = true;
    user.value = pUser;
  }

  void changeAge() {
    user.update((val) {
      val?.age = (val.age ?? 0) + 1;
    });
  }

  void addWork(String work) {
    user.update((val) {
      val!.jobs = [
        ...val.jobs!, work
      ];
    });
  }
}