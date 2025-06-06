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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No title',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      category: json['category'] ?? 'Unknown',
      brand: json['brand'] ?? 'Unknown',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      stock: json['stock'] ?? 0,
      description: json['description'] ?? 'No description',
      images: List<String>.from(json['images'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'category': category,
      'brand': brand,
      'rating': rating,
      'stock': stock,
      'description': description,
      'images': images,
    };
  }
}
