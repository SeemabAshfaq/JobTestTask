// controllers/category_controller.dart
import 'package:get/get.dart';
import 'package:seemab_test_task/Models/category_model.dart';
import 'package:seemab_test_task/Models/product_model.dart';

class CategoryController extends GetxController {
  var searchQuery = ''.obs;
   var categoryList = <CategoryModel>[].obs;
    @override
  void onInit() {
    super.onInit();
    loadCategories(); // Fetch dummy or API data
  }

  void loadCategories() {
    categoryList.value = [
       CategoryModel(title: "SmartPhones", image: "https://tse1.mm.bing.net/th?id=OIP.tT7UG7QNOQKvijhtgqq2lAHaE8&pid=Api",
  productsList: [
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

  ]),
    CategoryModel(title: "Laptops", image: "https://tse1.mm.bing.net/th?id=OIP.tT7UG7QNOQKvijhtgqq2lAHaE8&pid=Api",productsList: [
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

    ]),
    CategoryModel(title: "Frisör", image: "https://tse1.mm.bing.net/th?id=OIP.tT7UG7QNOQKvijhtgqq2lAHaE8&pid=Api",productsList: [
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
       
        price: 60,
        rating: 4.3, 
         images: ['assets/images/iphone9.png','assets/images/iphone9.png','assets/images/iphone9.png'],
        id: 123, stock: 1234, description: 'abc',
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

    ]),
    CategoryModel(title: "Naglar", image: "https://tse1.mm.bing.net/th?id=OIP.tT7UG7QNOQKvijhtgqq2lAHaE8&pid=Api",productsList: [
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

    ]),
  
    ];
  }

    List<CategoryModel> get filteredList => categoryList
      .where((p) => p.title.toLowerCase().contains(searchQuery.value.toLowerCase()))
      .toList();   
}
