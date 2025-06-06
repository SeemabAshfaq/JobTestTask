import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seemab_test_task/Constants/colors.dart';
import 'package:seemab_test_task/Views/Categories/controller/categories_controller.dart';
import 'package:seemab_test_task/Views/Categories/view/category_card.dart';
import 'package:seemab_test_task/Views/ProductByCategory/view/product_by_category_view.dart';
import 'package:seemab_test_task/Widgets/custom_app_bar.dart';
import 'package:seemab_test_task/Widgets/custom_search_field.dart';
import 'package:shimmer/shimmer.dart';



class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final CategoryController controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CustomAppBar(title: "Categories"),
      body: Obx((){
           if(controller.isLoading.value){
  return 
  categoryScreenShimmer();
}

                                    else if (controller.filteredList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/categories.svg",
                  colorFilter: ColorFilter.mode( Colors.grey, BlendMode.srcIn), 
                  height: 40.h,width: 40.w,),
                  SizedBox(height: 16.h),
                  Text(
                    'No Categories found',
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
              child:  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("${controller.filteredList.length} results found",
                    style: GoogleFonts.poppins(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: lightBlackColor2.withValues(alpha: 0.25)
                    ),),
                  )
            ),
             SizedBox(height: 20.h),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.w),
                child:  GridView.builder(
                  physics: BouncingScrollPhysics(),
                itemCount: controller.filteredList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.h,
                  crossAxisSpacing: 30.w,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  final category = controller.filteredList[index];
                  return GestureDetector(
                    onTap: (){
                      Get.to(()=>ProductByCategoryView(category:category));
                    },
                    child: CategoryCard(category: category));
                },
                            )
                
                 
              ),
            ),
          ],
        ),
      );
      }) );
  }

 Widget categoryScreenShimmer() {
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

        // Results Text Placeholder
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

        // Grid Shimmer Placeholder
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 30.w,
                childAspectRatio: 1.1,
              ),
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    padding: EdgeInsets.all(10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 60.w,
                          width: 60.w,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Container(
                          height: 12.h,
                          width: 80.w,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}
}
