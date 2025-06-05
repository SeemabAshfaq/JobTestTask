import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:seemab_test_task/Views/BotomNavBar/controller/nav_bar_cntroller.dart';
import 'package:seemab_test_task/Views/splash/view/splash_screen.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  Get.put(BottomNavController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return  GetMaterialApp(
            builder: (context, widget) {
            // This line ensures that the app doesn't scale with the phone's font size settings
            return MediaQuery(
  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
  child: widget!,
);
          },
          debugShowCheckedModeBanner: false,
          title: 'Test Task',
          home: const SplashScreen(),
        );
      },
    );
  }
}
