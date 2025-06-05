import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seemab_test_task/Constants/colors.dart';
import 'package:seemab_test_task/Views/Categories/controller/categories_controller.dart';
import 'package:seemab_test_task/Views/Categories/view/category_card.dart';
import 'package:seemab_test_task/Views/ProductByCategory/view/product_by_category_view.dart';
import 'package:seemab_test_task/Views/Products/controller/product_controller.dart';
import 'package:seemab_test_task/Widgets/custom_app_bar.dart';
import 'package:seemab_test_task/Widgets/custom_search_field.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:seemab_test_task/Widgets/product_card.dart';


class CategoriesView extends StatefulWidget {
  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CustomAppBar(title: "Categories"),
      body: Padding(
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
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.w),
                child: Obx(() => GridView.builder(
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
                      Get.to(()=>ProductByCategoryView(Category:category));
                    },
                    child: CategoryCard(category: category));
                },
                            )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
