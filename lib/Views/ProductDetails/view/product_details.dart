  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:get/get.dart';
  import 'package:seemab_test_task/Constants/colors.dart';
  import 'package:seemab_test_task/Models/product_model.dart';
  import 'package:seemab_test_task/Views/Favourites/controller/favrouite_controller.dart';
  import 'package:seemab_test_task/Widgets/custom_app_bar.dart';

  class ProductDetailScreen extends StatelessWidget {
    final ProductModel product;

    ProductDetailScreen({required this.product});

    final FavoriteController favController = Get.put(FavoriteController());

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: whiteColor,
  appBar:  CustomAppBar(title: "Product Details",showBackIcon: true,),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(product.images.first, height: 200),
              ),
              const SizedBox(height: 16),
              
              // Product Info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.title,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Obx(() => IconButton(
                        icon: Icon(
                          favController.isFavorite(product)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.pink,
                        ),
                        onPressed: () => favController.toggleFavorite(product),
                      ))
                ],
              ),
              Text("Price: \$${product.price}", style: TextStyle(fontSize: 16)),
              Text("Category: ${product.category}"),
              Text("Brand: ${product.brand}"),
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(Icons.star,
                      color: index < product.rating.round()
                          ? Colors.amber
                          : Colors.grey),
                ),
              ),
              Text("Stock: ${product.stock}"),
              const SizedBox(height: 10),
              Text("Description:",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(product.description),
              const SizedBox(height: 16),
              Text("Product Gallery:",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
            
//            SizedBox(
//   height: 500.h,
//   child: GridView.builder(
//     physics: const BouncingScrollPhysics(),
//     itemCount: product.images.length, // First item is text
//     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2,
//       mainAxisSpacing: 20,
//       crossAxisSpacing: 20,
//     ),
//     itemBuilder: (context, index) {
//       if (index == 0) {
//         return  Container(
//           height: 109.h,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Product Gallery:",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                 ),
//                  Expanded(
//            // height: 109.h, // Force image grid cells to be taller
//             child: Image.asset(
//                 product.images[index], // shift because of text
//                 fit: BoxFit.cover,
//               ),
//           )
//               ],
//             ),
//         );
        
//       } else {
//         return Container(
//           color: yellowColor,
//         //  height: 109.h, // Force image grid cells to be taller
//           child: SizedBox(
//             height: 80.h,
//             child: Image.asset(
//                 product.images[index], // shift because of text
//                 fit: BoxFit.cover,
//               ),
//           ),
//         );
//       }
//     },
//   ),
// )

SizedBox(
  height: 800.h,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(  width: Get.width/2.3,
        child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: product.images.length+1,
                  itemBuilder: (context, index) {
                   
                    return Padding(
                      padding: EdgeInsets.only(bottom: index == product.images.length ? 40.h : 15.h),
                      child:index==0?
                       Padding(
                         padding:  EdgeInsets.only(top: 10.h),
                         child: Text(
                                           "Product Gallery:",
                                           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                         ),
                       ):
                      Padding(
                        padding:  EdgeInsets.only(left: 10.w),
                        child: Image.asset(
                          height: 109.h,
                                          product.images[index-1],// shift because of text
                                          fit: BoxFit.cover,
                                        ),
                      )
                    );
                  },
                ),
      ),
                SizedBox(    width: Get.width/2.4,
        child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: product.images.length,
                  itemBuilder: (context, index) {
                   
                    return Padding(
                      padding: EdgeInsets.only(bottom: index == product.images.length - 1 ? 40.h : 15),
                      child:Image.asset(
                        height: 109.h,
                  product.images[index], // shift because of text
                  fit: BoxFit.cover,
                ),
                    );
                  },
                ),
      ),
    ],
  ),
)
            ],
          ),
        ),
      );
    }
  }
