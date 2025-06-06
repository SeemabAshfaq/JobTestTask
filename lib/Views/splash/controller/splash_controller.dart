import 'dart:async';
import 'package:get/get.dart';
import 'package:seemab_test_task/Views/BotomNavBar/views/bottom_nav_bar.dart';


class SplashController extends GetxController {
  // var box = GetStorage();
  // var userController = Get.find<UserController>();

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() {
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() => const BottomNavBar());
    });
  }
}
