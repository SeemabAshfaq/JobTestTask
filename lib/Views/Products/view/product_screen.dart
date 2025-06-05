import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seemab_test_task/Constants/colors.dart';
import 'package:seemab_test_task/Views/Products/controller/product_controller.dart';
import 'package:seemab_test_task/Widgets/custom_app_bar.dart';
import 'package:seemab_test_task/Widgets/custom_search_field.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:seemab_test_task/Widgets/product_card.dart';


class ProductScreen extends StatefulWidget {
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
              child: Obx(() => ListView.builder(
                physics: BouncingScrollPhysics(),
                    itemCount: controller.filteredList.length,
                    itemBuilder: (context, index) {
                      final product = controller.filteredList[index];
                      return Padding(
                        padding:  EdgeInsets.only(bottom: index==controller.filteredList.length-1?40.h:20),
                        child: ProductCard(product: product),
                      );   },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
