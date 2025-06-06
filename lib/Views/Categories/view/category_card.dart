  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:google_fonts/google_fonts.dart';
  import 'package:seemab_test_task/Constants/colors.dart';
  import 'package:seemab_test_task/Models/category_model.dart';

  class CategoryCard extends StatelessWidget {
    final CategoryModel category;

    const CategoryCard({super.key, required this.category});

    @override
    Widget build(BuildContext context) {
      return Container(
        height: 125.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          image: DecorationImage(
            image: NetworkImage("https://up.yimg.com/ib/th?id=OIP.Sap1tVVy17u4J2aHV8nqTQHaE8&pid=Api&rs=1&c=1&qlt=95&w=176&h=117"),
            fit: BoxFit.cover,
            
          ),
        ),
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 15.w),
        child: Text(
          category.name,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w800,
            fontSize: 12.sp,
            color: whiteColor2,
          ),
        ),
      );
    }
  }
