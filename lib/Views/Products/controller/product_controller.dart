import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:seemab_test_task/Models/product_model.dart';
import 'package:seemab_test_task/Views/ProductDetails/view/product_details.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
   var searchQuery = ''.obs;
  var isLoading = false.obs;
  var product = Rxn<ProductModel>();
  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  void loadProducts() async {
   
    try {
       isLoading.value = true;
      final response = await http.get(Uri.parse('https://dummyjson.com/products?limit=100'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List products = data['products'] ?? [];

        productList.value = products
            .map((productJson) => ProductModel.fromJson(productJson))
            .toList();
      } else {
    
      }
    } catch (e) {
      isLoading.value = false;
     // print('Error fetching products: $e');
    } finally {
      isLoading.value = false;
    }
  }

  List<ProductModel> get filteredList {
  if (searchQuery.value.isEmpty) {
    return productList;
  }
  return productList
      .where((p) => p.title.toLowerCase().contains(searchQuery.value.toLowerCase()))
      .toList();
}

      Future<void> fetchProductDetails(int id) async {
    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse('https://dummyjson.com/products/$id'),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        product.value = ProductModel.fromJson(jsonData);
      Get.to(()=>ProductDetailScreen(product:product.value));
      } else {
        
      }
    } catch (e) {
         isLoading.value = false;
         
    } finally {
      isLoading.value = false;
    }
  }

 @override
  void onClose() {
    searchQuery.value = '';
    // Force a refresh of filteredList by updating productList (triggering the getter)
    productList.refresh();
    super.onClose();
  }
}
