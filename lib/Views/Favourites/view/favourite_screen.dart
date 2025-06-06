import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seemab_test_task/Constants/colors.dart';
import 'package:seemab_test_task/Views/Favourites/controller/favrouite_controller.dart';
import 'package:seemab_test_task/Widgets/custom_app_bar.dart';
import 'package:seemab_test_task/Widgets/custom_search_field.dart';
import 'package:flutter_rating/flutter_rating.dart';



class FavouritesView extends StatefulWidget {
  const FavouritesView({super.key});

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {
  // final CategoryController controller = Get.put(CategoryController());
      final FavoriteController favController = Get.find<FavoriteController>();
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
              onChanged: (value) => favController.searchQuery.value = value,
            ),
             SizedBox(height: 12.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Obx(() => Align(
                    alignment: Alignment.centerLeft,
                    child: Text("${favController.filteredList.length} results found",
                    style: GoogleFonts.poppins(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: lightBlackColor2.withValues(alpha: 0.25)
                    ),),
                  )),
            ),
             SizedBox(height: 20.h),
      Expanded(
        child: Obx((){
                    if (favController.filteredList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, color: Colors.grey, size: 64.h),
                  SizedBox(height: 16.h),
                  Text(
                    'No favourites found',
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
          return ListView.builder(
          itemCount: favController.filteredList.length,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,index){
            var product= favController.filteredList[index];
          return       
          
           Padding(
            padding:  EdgeInsets.only(bottom: index==favController.filteredList.length-1?30.h:25.h),
            child: Container(
                 
                 decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5.r),
                    bottomRight: Radius.circular(5.r),
              ),
              border: Border(
                    left: BorderSide(color: lightBlackColor2.withValues(alpha:0.05), width: 1),
                    right:  BorderSide(color: lightBlackColor2.withValues(alpha:0.05), width: 1),
                    bottom:  BorderSide(color: lightBlackColor2.withValues(alpha:0.05), width: 1),
                    // No top border
              ),
            ),
                    child: Padding(
            padding:  EdgeInsets.all(13.h),
            child: Row(
              children: [
                // Circle image
                CircleAvatar(
                  radius: 31.r,
                 // backgroundColor: yellowColor,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: product.images.isNotEmpty?
                    Image.network(
                     product.images[0],
                      width: 62.w,
                      height: 62.w,
                      fit: BoxFit.cover,
                    ):null
                  ),
                ),
                SizedBox(width: 14.w),
                    
                // Text content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( product.title,
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp, fontWeight: FontWeight.w800,
                            color: lightBlackColor2)),
                      SizedBox(height: 4),
                      Text('\$${product.price.toString()}',
                          style: GoogleFonts.poppins(
                            fontSize: 11.sp, fontWeight: FontWeight.w800,
                            color: lightBlackColor2)),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text(product.rating.toString(),
                              style: GoogleFonts.poppins(
                            fontSize: 10.sp, fontWeight: FontWeight.w800,
                            color: lightBlackColor2)),
                          SizedBox(width: 4),
                            StarRating(
                          size: 12.h,
                          rating: product.rating,
                          starCount: 5,
                          onRatingChanged: null,
                        ),
                        ],
                      ),
                    ],
                  ),
                ),
                    
                // Heart icon
                                            Obx(() => GestureDetector(
                            onTap: (){
                              favController.toggleFavorite(product);
                            },
                            child:   
                            SvgPicture.asset(favController.isFavorite(product)?"assets/icons/heart.svg":"assets/icons/fav2.svg",width: 16.w,height: 16.h,)
                          
                            
                           
                          ),)
                
              ],
            ),
                    ),
              ),
          );
            
        });
        })
      )  ],
        ),
      ),
    );
  }
}
