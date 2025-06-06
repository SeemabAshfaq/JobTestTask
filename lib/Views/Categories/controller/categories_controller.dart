import 'dart:convert';
import 'package:get/get.dart';
import 'package:seemab_test_task/Models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  var searchQuery = ''.obs;
    var isLoading = false.obs;
   var categoryList = <CategoryModel>[].obs;
    @override
  void onInit() {
    super.onInit();
     fetchCategories();
  }

void fetchCategories() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('https://dummyjson.com/products/categories'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final parsedCategories = jsonList
            .map((json) => CategoryModel.fromJson(json))
            .toList();
        categoryList.assignAll(parsedCategories);
      } else {
        Get.snackbar('Error', 'Failed to load categories');
      }
    } catch (e) {
      isLoading.value = false;
      print("Excetion:${e.toString()}");
      Get.snackbar('Exception', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
    List<CategoryModel> get filteredList => categoryList
      .where((p) => p.name.toLowerCase().contains(searchQuery.value.toLowerCase()))
      .toList();   
}

