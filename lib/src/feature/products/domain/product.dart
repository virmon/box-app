class Product {
  final String id;
  final String name;
  final String brand;
  final String model;
  final String description;
  final double price;
  final List<String> imageUrls;
  final String category;
  final int stockQuantity;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.model,
    required this.description,
    required this.price,
    required this.imageUrls,
    required this.category,
    required this.stockQuantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      brand: json['brand'] as String,
      model: json['model'] as String,
      description: json['description'] as String,
      price: (json['price'] as num)
          .toDouble(), // Handle potential int or double
      imageUrls: List<String>.from(json['imageUrls'] as List),
      category: json['category'] as String,
      stockQuantity: json['stockQuantity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'model': model,
      'description': description,
      'price': price,
      'imageUrls': imageUrls,
      'category': category,
      'stockQuantity': stockQuantity,
    };
  }

  Product copyWith({
    String? id,
    String? name,
    String? brand,
    String? model,
    String? description,
    double? price,
    List<String>? imageUrls,
    String? category,
    int? stockQuantity,
  }) => Product(
    id: id ?? this.id,
    name: name ?? this.name,
    brand: brand ?? this.brand,
    model: model ?? this.model,
    description: description ?? this.description,
    price: price ?? this.price,
    imageUrls: imageUrls ?? this.imageUrls,
    category: category ?? this.category,
    stockQuantity: stockQuantity ?? this.stockQuantity,
  );
}
