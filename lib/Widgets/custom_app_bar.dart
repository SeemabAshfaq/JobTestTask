import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seemab_test_task/Constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? showBackIcon;
  const CustomAppBar({Key? key, required this.title, this.showBackIcon,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: whiteColor,
      shadowColor: whiteColor,
      foregroundColor: whiteColor,
      surfaceTintColor: whiteColor,
      clipBehavior: Clip.none,
      scrolledUnderElevation: 0,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: GoogleFonts.playfairDisplay(
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
          color:  lightBlackColor2,
        ),
      ),
      leading: showBackIcon==true?GestureDetector(
        onTap: (){
          Get.back();
        },
        child: SizedBox(
        height: 24.h,
            width: 24.w,
          child: Center(
            child: SvgPicture.asset(
            
              "assets/icons/backIcon.svg",
            ),
          ),
        ),
      ):null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
