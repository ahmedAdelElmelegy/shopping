import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';

class CartProductResult {
  final List<ProductEntity> product;
  final Set<int> id;
  final int totalPrice;
  final List<int> cart_id;
  final List<int> quantity;

  CartProductResult(this.totalPrice,
      {required this.cart_id,
      required this.product,
      required this.id,
      required this.quantity});
}
