import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/feature/cart/domain/entites/cart_product_result.dart';
import 'package:shopping_app/feature/cart/domain/entites/cart_update.dart';

abstract class CartRepo {
  Future<Either<Failure, CartProductResult>> fetchCart();
  Future<Either<Failure, void>> addToCart(int productId);
  Future<Either<Failure, void>> removeToCart(int productId);
  Future<Either<Failure, void>> updateCartQuantity(
      CartUpdateModel cartModelUpdate);
}
