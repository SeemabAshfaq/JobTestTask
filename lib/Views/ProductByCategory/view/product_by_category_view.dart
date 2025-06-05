import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seemab_test_task/Constants/colors.dart';
import 'package:seemab_test_task/Models/category_model.dart';
import 'package:seemab_test_task/Models/product_model.dart';
import 'package:seemab_test_task/Views/ProductDetails/view/product_details.dart';
import 'package:seemab_test_task/Widgets/custom_app_bar.dart';
import 'package:seemab_test_task/Widgets/custom_search_field.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:seemab_test_task/Widgets/product_card.dart';


class ProductByCategoryView extends StatefulWidget {
  final CategoryModel Category;

  const ProductByCategoryView({super.key, required this.Category});
  @override
  State<ProductByCategoryView> createState() => _ProductByCategoryViewState();
}

class _ProductByCategoryViewState extends State<ProductByCategoryView> {
  String searchQuery = '';
  List get filteredProducts {
    if (searchQuery.isEmpty) return widget.Category.productsList;
    return widget.Category.productsList.where((product) {
      final title = product.title?.toLowerCase() ?? '';
      final brand = product.brand?.toLowerCase() ?? '';
      final category = product.category?.toLowerCase() ?? '';
      final query = searchQuery.toLowerCase();
      return title.contains(query) || brand.contains(query) || category.contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar:  CustomAppBar(title: widget.Category.title,showBackIcon: true,),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            CustomSearchField(
              onChanged: (value) => setState(() => searchQuery = value),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${filteredProducts.length} results found",
                  style: GoogleFonts.poppins(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: lightBlackColor2.withValues(alpha: 0.25),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: index == filteredProducts.length - 1 ? 40.h : 20),
                    child: GestureDetector(
                      onTap: (){
                        Get.to(()=>ProductDetailScreen(product: product,));
                      },
                      child: ProductCard(product: product)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
