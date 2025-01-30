class Product {
  final num id;
  final num price;
  final num oldPrice;
  final num discount;
  final String image;
  final String name;
  final String description;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  // Factory method to create a Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as num,
      price: json['price'] as num,
      oldPrice: json['old_price'] as num,
      discount: json['discount'] as num,
      image: json['image'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  // Convert Product instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'price': price,
      'old_price': oldPrice,
      'discount': discount,
      'image': image,
      'name': name,
      'description': description,
    };
  }
}
