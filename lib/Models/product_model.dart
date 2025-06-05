class ProductModel {
  final int id;
  final String title;
  final double price;
  final String category;
  final String brand;
  final double rating;
  final int stock;
  final String description;
  final List<String> images;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.brand,
    required this.rating,
    required this.stock,
    required this.description,
    required this.images,
  });
}
