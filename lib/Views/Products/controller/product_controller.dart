import 'package:get/get.dart';
import 'package:seemab_test_task/Models/product_model.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts(); // Fetch dummy or API data
  }

  void loadProducts() {
    productList.value = [
      ProductModel(
        title: 'Iphone 14',
        brand: 'Apple',
        category: 'smartphones',
          images: ['assets/images/iphone9.png','assets/images/iphone9.png','assets/images/iphone9.png'],
        id: 123, stock: 1234, description: 'abc',
        price: 60,
        rating: 4.4,
      ),
      ProductModel(
        title: 'Samsung Galaxy Book',
        brand: 'Samsung',
        category: 'laptops',
          images: ['assets/images/iphone9.png','assets/images/iphone9.png','assets/images/iphone9.png'],
        id: 123, stock: 1234, description: 'abc',
        price: 60,
        rating: 4.3,
      ),
       ProductModel(
        title: 'Iphone 14',
        brand: 'Apple',
        category: 'smartphones',
          images: ['assets/images/iphone9.png','assets/images/iphone9.png','assets/images/iphone9.png'],
        id: 123, stock: 1234, description: 'abc',
        price: 60,
        rating: 4.4,
      ),
    ];
  }

  List<ProductModel> get filteredList => productList
      .where((p) => p.title.toLowerCase().contains(searchQuery.value.toLowerCase()))
      .toList();   
}
