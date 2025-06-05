import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seemab_test_task/Constants/colors.dart';
import 'package:seemab_test_task/Views/BotomNavBar/controller/nav_bar_cntroller.dart';
import 'package:seemab_test_task/Views/Categories/view/categories_view.dart';
import 'package:seemab_test_task/Views/Products/view/product_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _pages = [
    ProductScreen(),
    CategoriesView(),
     SizedBox(),
      SizedBox(),
  ];

  final List<String> _labels = ["Products", "Categories", "Favourites", "Seemab"];
  final List<String> _icons = [
    "assets/icons/products.svg",
    "assets/icons/categories.svg",
    "assets/icons/fav.svg",
    "assets/icons/profile.svg",
  ];
  var controller = Get.find<BottomNavController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _pages[controller.currentIndex.value]),
      bottomNavigationBar: BottomAppBar(
        height: 75.h,
        padding: EdgeInsets.zero,
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          height: 75.h,
          decoration: BoxDecoration(
            color: blackColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              topRight: Radius.circular(15.r)
            )
          ),
        //  margin: EdgeInsets.symmetric(horizontal: 24.w),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
           // crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              _icons.length,
              (index) => buildNavItem(index, _icons[index], _labels[index]),
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector buildNavItem(int index, String iconPath, String label) {
    return GestureDetector(
      onTap: () {
        controller.updateIndex(index);
      },
      child: Obx(() {
        final isSelected = controller.currentIndex.value == index;
        return Container(
          height: 75.h,
          width: MediaQuery.of(context).size.width/4,
          decoration: BoxDecoration(
             borderRadius: BorderRadius.only(
              topLeft: index==0? Radius.circular(15.r):Radius.circular(0.r),
              topRight: index==3?Radius.circular(15.r):Radius.circular(0.r),
            ),
            color: isSelected ? lightBlackColor.withValues(alpha: 0.05) : Colors.transparent,
          ),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                 iconPath, // Unselected icon
                width: 21.w,
                height: 21.h,
              ),
              SizedBox(height:8.h),
              Text(
                      label,
                      style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: whiteColor,
                      ),
                    )
            ],
          ),
        );
      }),
    );
  }
}
