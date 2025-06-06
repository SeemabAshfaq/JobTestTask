import 'package:get/get.dart';
import 'package:seemab_test_task/Models/user_model.dart';

class UserController extends GetxController {
  var user = UserModel(
    name: "Seemab",
    email: "seemabashfaq25@gmail.com",
    phoneNumber: "476477q3473",
    avatarUrl: "", 
  ).obs;
}
