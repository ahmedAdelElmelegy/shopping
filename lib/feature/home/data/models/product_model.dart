import 'package:get/get_connect/http/src/request/request.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  num id;
  num price;
  num oldPrice;
  num discount;
  String image;
  String name;
  String description;
  List<dynamic> images;
  bool inFavorites;
  bool inCart;

  ProductModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  }) : super(
            productId: id,
            productName: name,
            productImage: image,
            productDescription: description,
            productPrice: price,
            productsmImage: images,
            productOldPrice: oldPrice);

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as num,
        price: json['price'] as num,
        oldPrice: json['old_price'] as num,
        discount: json['discount'] as num,
        image: json['image'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        images: json['images'] as List<dynamic>,
        inFavorites: json['in_favorites'] as bool,
        inCart: json['in_cart'] as bool,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'old_price': oldPrice,
        'discount': discount,
        'image': image,
        'name': name,
        'description': description,
        'images': images,
        'in_favorites': inFavorites,
        'in_cart': inCart,
      };
}
