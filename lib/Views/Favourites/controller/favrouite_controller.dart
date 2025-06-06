import 'package:get/get.dart';
import 'package:seemab_test_task/Models/product_model.dart';

class FavoriteController extends GetxController {
  var favoriteProducts = <ProductModel>[].obs;
    var searchQuery = ''.obs;

  bool isFavorite(ProductModel product) =>
      favoriteProducts.any((p) => p.id == product.id);

  void toggleFavorite(ProductModel product) {
    if (isFavorite(product)) {
      favoriteProducts.removeWhere((p) => p.id == product.id);
    } else {
      favoriteProducts.add(product);
    }
  }

  
    List<ProductModel> get filteredList => favoriteProducts
      .where((p) => p.title.toLowerCase().contains(searchQuery.value.toLowerCase()))
      .toList();
}
