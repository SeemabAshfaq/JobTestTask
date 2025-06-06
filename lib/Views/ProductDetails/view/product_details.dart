  import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
  import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
  import 'package:seemab_test_task/Constants/colors.dart';
  import 'package:seemab_test_task/Models/product_model.dart';
  import 'package:seemab_test_task/Views/Favourites/controller/favrouite_controller.dart';
  import 'package:seemab_test_task/Widgets/custom_app_bar.dart';
import 'package:shimmer/shimmer.dart';

  class ProductDetailScreen extends StatelessWidget {
    final ProductModel? product;


    ProductDetailScreen({super.key, required this.product});

    final FavoriteController favController = Get.find<FavoriteController>();

    @override
    Widget build(BuildContext context) {
      
      return Scaffold(
        backgroundColor: whiteColor,
  appBar:  CustomAppBar(title: "Product Details",showBackIcon: true,),
        body: SingleChildScrollView(
          child: 
          product == null?Center(
            child: Text(
              'No product found',
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ):
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Image
             SizedBox(
              //color: yellowColor,
               height: 209.h,width: double.infinity,
              child: Image.network(product!.images.first, fit:BoxFit.cover,
               loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
      child: Container(
          height: 209.h,
        width: double.infinity,
        color: Colors.grey.shade200,
        //child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      ),
    );
  },
  errorBuilder: (context, error, stackTrace) {
    return Container(
      width: double.infinity,
      height: 209.h,
      color: Colors.grey.shade200,
      child: Icon(Icons.broken_image, size: 30.sp, color: Colors.grey),
    );
  },)),
               SizedBox(height: 16.h),
              
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: 24.w),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Product Details",
                            style: GoogleFonts.poppins(fontSize: 18.sp,
                             fontWeight: FontWeight.w800,
                             color: lightBlackColor2)),
                              Obx(() => GestureDetector(
                            onTap: (){
                              favController.toggleFavorite(product!);
                            },
                            child:   
                            SvgPicture.asset(favController.isFavorite(product!)?"assets/icons/fav2.svg":"assets/icons/heart.svg",width: 27.w,height: 22.h,)
                          
                            
                           
                          ),)
                      ],
                    ),
                     SizedBox(height: 8.h,),
                Row(
                  children: [
                    Text("Name:   ", style: GoogleFonts.poppins(fontSize: 12.sp,fontWeight: FontWeight.w800,
                    color: lightBlackColor2)),
                     Text(product!.title, style: GoogleFonts.poppins(fontSize: 10.sp,fontWeight: FontWeight.w400,
                    color: lightBlackColor2)),
                  ],
                ),
                SizedBox(height: 8.h,),
                  Row(
                  children: [
                    Text("Price:   ", style: GoogleFonts.poppins(fontSize: 12.sp,fontWeight: FontWeight.w800,
                    color: lightBlackColor2)),
                     Text("\$${product?.price}", style: GoogleFonts.poppins(fontSize: 10.sp,fontWeight: FontWeight.w400,
                    color: lightBlackColor2)),
                  ],
                ),
                SizedBox(height: 8.h,),
                  Row(
                  children: [
                    Text("Category:   ", style: GoogleFonts.poppins(fontSize: 12.sp,fontWeight: FontWeight.w800,
                    color: lightBlackColor2)),
                     Text(product!.category, style: GoogleFonts.poppins(fontSize: 10.sp,fontWeight: FontWeight.w400,
                    color: lightBlackColor2)),
                  ],
                ),
                SizedBox(height: 8.h,),
                  Row(
                  children: [
                    Text("Brand:   ", style: GoogleFonts.poppins(fontSize: 12.sp,fontWeight: FontWeight.w800,
                    color: lightBlackColor2)),
                     Text(product!.brand, style: GoogleFonts.poppins(fontSize: 10.sp,fontWeight: FontWeight.w400,
                    color: lightBlackColor2)),
                  ],
                ),
                SizedBox(height: 8.h,),
                  Row(
                  children: [
                    Text("Rating:   ", style: GoogleFonts.poppins(fontSize: 12.sp,fontWeight: FontWeight.w800,
                    color: lightBlackColor2)),
                     Text(product!.rating.toString(), style: GoogleFonts.poppins(fontSize: 10.sp,fontWeight: FontWeight.w400,
                    color: lightBlackColor2)),
                    SizedBox(width: 5.w,),
                     StarRating(
                      size: 12.h,
                      rating: product!.rating,
                      starCount: 5,
                      onRatingChanged: null,
                    ),
                  ],
                ),
                SizedBox(height: 8.h,),
                  Row(
                  children: [
                    Text("Stock:   ", style: GoogleFonts.poppins(fontSize: 12.sp,fontWeight: FontWeight.w800,
                    color: lightBlackColor2)),
                     Text(product!.stock.toString(), style: GoogleFonts.poppins(fontSize: 10.sp,fontWeight: FontWeight.w400,
                    color: lightBlackColor2)),
                  ],
                ),
                SizedBox(height: 8.h,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description :   ", style: GoogleFonts.poppins(fontSize: 12.sp,fontWeight: FontWeight.w800,
                    color: lightBlackColor2)),
                     Padding(
                       padding:  EdgeInsets.symmetric(horizontal: 5.w),
                       child: Text(product!.title, style: GoogleFonts.poppins(fontSize: 10.sp,fontWeight: FontWeight.w400,
                                           color: lightBlackColor2)),
                     ),
                  ],
                ),
                SizedBox(height: 8.h,),
                           
               
               SizedBox(
                 height: 350.h,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     SizedBox(  width: Get.width/2.3,
                       child: ListView.builder(
  physics: BouncingScrollPhysics(),
  itemCount: ((product!.images.length + 1) / 2).ceil() + 1, // +1 for header
  itemBuilder: (context, index) {
    if (index == 0) {
      return Padding(
        padding: EdgeInsets.only(top: 10.h,bottom: 20.h),
        child: Text(
          "Product Gallery:",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w800,
            fontSize: 12.sp,
          ),
        ),
      );
    }

    int imageIndex = (index - 1) * 2;

    if (imageIndex >= product!.images.length) return SizedBox();

    return Padding(
      padding: EdgeInsets.only(bottom: index == ((product!.images.length + 1) / 2).ceil() ? 40.h : 15.h, left: 7.w),
      child: Image.network(
        product!.images[imageIndex],
        height: 109.h,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
      child: Container(
          height: 109.h,
        width: double.infinity,
        color: Colors.grey.shade200,
        //child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      ),
    );
  },
  errorBuilder: (context, error, stackTrace) {
    return Container(
      width: double.infinity,
      height: 109.h,
      color: Colors.grey.shade200,
      child: Icon(Icons.broken_image, size: 30.sp, color: Colors.grey),
    );
  },
      ),
      
    );
  },
)

                     ),
                  SizedBox(    width: Get.width/2.4,
                       child: ListView.builder(
  physics: BouncingScrollPhysics(),
  itemCount: (product!.images.length / 2).floor(),
  itemBuilder: (context, index) {
    int imageIndex = (index * 2) + 1;

    if (imageIndex >= product!.images.length) return SizedBox();

    return Padding(
      padding: EdgeInsets.only(bottom: index == (product!.images.length / 2).floor() - 1 ? 40.h : 15.h),
      child: Image.network(
        product!.images[imageIndex],
        height: 109.h,
        fit: BoxFit.cover,
         loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
      child: Container(
          height: 109.h,
        width: double.infinity,
        color: Colors.grey.shade200,
        //child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      ),
    );
  },
  errorBuilder: (context, error, stackTrace) {
    return Container(
      width: double.infinity,
      height: 109.h,
      color: Colors.grey.shade200,
      child: Icon(Icons.broken_image, size: 30.sp, color: Colors.grey),
    );
  },
      ),
    );
  },
)

                     ),
                   ],
                 ),
               )
                ],
               ),
             )
            ],
          ),
        ),
      );
    }
  }
