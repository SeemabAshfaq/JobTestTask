import 'package:get/get.dart';
import 'package:seemab_test_task/Views/Categories/controller/categories_controller.dart';
import 'package:seemab_test_task/Views/Products/controller/product_controller.dart';

class BottomNavController extends GetxController {
    final ProductController productController = Get.put(ProductController());
      final CategoryController categoryController = Get.put(CategoryController());
  var currentIndex = 0.obs;

  void updateIndex(int index) {
    currentIndex.value = index;
    if (index == 0) {
      productController.searchQuery.value = '';
      productController.productList.refresh();
      productController.loadProducts();
    } else if (index == 1) {
      categoryController.fetchCategories();
    } else {}
  }
}
