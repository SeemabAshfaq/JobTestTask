import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seemab_test_task/Constants/colors.dart';
import 'package:seemab_test_task/Views/splash/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController = Get.put(SplashController());

    return Scaffold(
      
      body: Container(
        height: Get.height,
        decoration: BoxDecoration(
          
          image: DecorationImage(image: AssetImage("assets/images/splash.png"),
          fit: BoxFit.fill
          )
        ),
       // decoration: const BoxDecoration(color: mainGreenColor),
        child: Padding(
          padding:  EdgeInsets.only(top:50.h,bottom: 120.h,left: 60.w,right: 60.w),
          child: Column(
            children: [
              Text("My Store",
              style:GoogleFonts.playfairDisplay(
                fontSize: 50.sp,
                fontWeight: FontWeight.w400,
                color: blackColor
              )
              ),
              Spacer(),
                Text("Valkommen",
              style:GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
                color: whiteColor
              )
              ),
              SizedBox(height: 15.h,),
              Text("Hos ass kan du baka tid has nastan alla Sveriges salonger och motagningar. Baka frisor, massage, skonhetsbehandingar, friskvard och mycket mer.",
              textAlign: TextAlign.center,
              style:GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: whiteColor
              )
              ),
          
            ],
          ),
        )
      ),
    );
  }
}
