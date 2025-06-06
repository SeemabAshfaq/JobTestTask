import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:seemab_test_task/Models/product_model.dart';

class ProductByCategoryController extends GetxController {
    var productsOfCategoryList = <ProductModel>[].obs;
   var searchQuery = ''.obs;
  var isLoading = false.obs;    
void loadProductsOfCategory(String categoryId) async {
  try {
    isLoading.value = true;
    final response = await http.get(Uri.parse('https://dummyjson.com/products?limit=100'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List products = data['products'] ?? [];

      // Convert and filter products by category
      final filtered = products
          .map((productJson) => ProductModel.fromJson(productJson))
          .where((product) => product.category == categoryId)
          .toList();

      productsOfCategoryList.value = filtered;
    } else {
    }
  } catch (e) {
    isLoading.value = false;
  } finally {
    isLoading.value = false;
  }
}
  List<ProductModel> get filteredCategoryList => productsOfCategoryList
      .where((p) =>
          p.title.toLowerCase().contains(searchQuery.value.toLowerCase()))
      .toList().obs;
       @override
  void onClose() {
    searchQuery.value = '';
    super.onClose();
  }

}
