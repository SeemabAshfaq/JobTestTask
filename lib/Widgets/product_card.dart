import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seemab_test_task/Constants/colors.dart';
import 'package:seemab_test_task/Models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(5.r),
          bottomRight: Radius.circular(5.r),
        ),
        side: BorderSide(
          color: lightBlackColor2.withAlpha(13),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Image.asset(
              product.images[0],
              height: 172.77.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 25.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.title,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w800,
                        fontSize: 14.sp,
                        color: lightBlackColor2,
                      ),
                    ),
                    Text(
                      "\$${product.price}",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w800,
                        fontSize: 18.sp,
                        color: lightBlackColor2,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      product.rating.toString(),
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w800,
                        fontSize: 10.sp,
                        color: lightBlackColor2,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    StarRating(
                      size: 12.h,
                      rating: product.rating,
                      starCount: 5,
                      onRatingChanged: null,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  "by ${product.brand}",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    color: lightBlackColor2.withAlpha(102),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  product.category,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    color: lightBlackColor2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
