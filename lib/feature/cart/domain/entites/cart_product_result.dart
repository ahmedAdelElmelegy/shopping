import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';

class CartProductResult {
  final List<ProductEntity> product;
  final Set<int> id;

  CartProductResult({required this.product, required this.id});
}
