import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seemab_test_task/Constants/colors.dart';
import 'package:seemab_test_task/Views/UserProfile/controller/user_controller.dart';

class UserProfleScreen extends StatelessWidget {
  final UserController userController = Get.find<UserController>();

   UserProfleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Obx(() {
          final user = userController.user.value;

          return Padding(
            padding: EdgeInsets.all(24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Center(
                  child: Text(
                    "Mitt konto",
                    style: GoogleFonts.poppins(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w800,
                      color: lightBlackColor2
                      ,
                    ),
                  ),
                ),
                SizedBox(height: 28.h),

                // Profile box
                Container(
                
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: lightBlackColor2,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 31  ,
                        backgroundColor: whiteColor2,
                        backgroundImage: user.avatarUrl.isNotEmpty
                            ? NetworkImage(user.avatarUrl)
                            : null,
                        
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user.name,
                              style: GoogleFonts.poppins(
                                  color: whiteColor2,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w800)),
                          SizedBox(height: 8.h),
                          Text(user.email,
                              style:  GoogleFonts.poppins(
                                  color: whiteColor2,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400)),
                          SizedBox(height: 2.h),
                          Text(user.phoneNumber,
                              style:  GoogleFonts.poppins(
                                  color: whiteColor2,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),

                // Menu options
               Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 25.w ),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     _accountOption("assets/icons/settings.svg", "Kontoinställningar"),
                  _accountOption("assets/icons/mine.svg", "Mina betalmetoder"),
                  _accountOption("assets/icons/support.svg", "Support"),
                  ],
                 ),
               )
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _accountOption(String iconPath, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
         SvgPicture.asset(
iconPath,
height: 18.h,
width: 18.w,
         ),
          SizedBox(width: 12.w),
          Text(
            title,
            style: GoogleFonts.poppins(fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: blackColor),
          ),
        ],
      ),
    );
  }
}
