import 'package:shopping_app/feature/settings/domain/entity/favorite_entity.dart';
import 'product.dart';

class FavoriteModel extends FavoriteEntity {
  final num id;
  final Product product;

  FavoriteModel({
    required this.id,
    required this.product,
  }) : super(
            delId: id,
            productId: product.id,
            productPrice: product.price,
            productName: product.name,
            productDesc: product.description,
            productImage: product.image);

  // Factory method to create a FavoriteModel from JSON
  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'] as num,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );
  }

  // Convert FavoriteModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
    };
  }
}
