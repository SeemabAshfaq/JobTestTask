import 'package:seemab_test_task/Models/product_model.dart';

class CategoryModel {
  final String title;
  final String image;
  final List<ProductModel> productsList;

  CategoryModel({required this.title, required this.image,required this.productsList});
}