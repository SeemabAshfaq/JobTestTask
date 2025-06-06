import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seemab_test_task/Constants/colors.dart';
import 'package:seemab_test_task/Views/Products/controller/product_controller.dart';
import 'package:seemab_test_task/Widgets/custom_app_bar.dart';
import 'package:seemab_test_task/Widgets/custom_search_field.dart';
import 'package:seemab_test_task/Widgets/product_card.dart';
import 'package:shimmer/shimmer.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CustomAppBar(title: "Products"),
      body: Obx((){
        if(controller.isLoading.value){
  return productScreenShimmer();
}
              else if (controller.filteredList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/products.svg",
                  colorFilter: ColorFilter.mode( Colors.grey, BlendMode.srcIn), 
                  height: 40.h,width: 40.w,),
                  SizedBox(height: 16.h),
                  Text(
                    'No Products found',
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }
        return Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            CustomSearchField(
              onChanged: (value) => controller.searchQuery.value = value,
            ),
             SizedBox(height: 12.h),
            Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Obx(() => Align(
                    alignment: Alignment.centerLeft,
                    child: Text("${controller.filteredList.length} results found",
                    style: GoogleFonts.poppins(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: lightBlackColor2.withValues(alpha: 0.25)
                    ),),
                  )),
            ),
             SizedBox(height: 20.h),
            Expanded(
              child:  ListView.builder(
                physics: BouncingScrollPhysics(),
                    itemCount: controller.filteredList.length,
                    itemBuilder: (context, index) {
                      final product = controller.filteredList[index];
                      return Padding(
                        padding:  EdgeInsets.only(bottom: index==controller.filteredList.length-1?40.h:20),
                        child: GestureDetector(
                          onTap: (){
                            controller.fetchProduct(product.id);
                          },
                          child: ProductCard(product: product)),
                      );   },
                  )
              
            ),
          ],
        ),
      );
      })  );
  }




Widget productScreenShimmer() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 24.w),
    child: Column(
      children: [
        // Search Field Placeholder
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 45.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            margin: EdgeInsets.only(top: 20.h),
          ),
        ),
        SizedBox(height: 12.h),

        // Results Found Text Placeholder
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 10.h,
              width: 100.w,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 20.h),

        // Shimmer List Placeholder
        Expanded(
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: index == 5 ? 40.h : 20.h,
                ),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 120.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    padding: EdgeInsets.all(12.w),
                    child: Row(
                      children: [
                        Container(
                          width: 80.w,
                          height: 80.w,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 12.h,
                                width: 100.w,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 8.h),
                              Container(
                                height: 10.h,
                                width: 60.w,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 8.h),
                              Container(
                                height: 14.h,
                                width: 80.w,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

}
