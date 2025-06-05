import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
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
