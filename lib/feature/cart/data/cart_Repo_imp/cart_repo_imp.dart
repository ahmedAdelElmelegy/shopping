import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/feature/cart/data/data_source/cart_remote_data_source.dart';
import 'package:shopping_app/feature/cart/domain/cart_Repo/cart_repo.dart';
import 'package:shopping_app/feature/cart/domain/entites/cart_product_result.dart';
import 'package:shopping_app/feature/cart/domain/entites/cart_update.dart';

class CartRepoImp extends CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepoImp({required this.cartRemoteDataSource});
  @override
  Future<Either<Failure, CartProductResult>> fetchCart() async {
    try {
      CartProductResult cartProductResult =
          await cartRemoteDataSource.fetchCart();
      return right(cartProductResult);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> addToCart(int productId) async {
    try {
      await cartRemoteDataSource.addToCart(productId);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> removeToCart(int productId) async {
    try {
      await cartRemoteDataSource.removeToCart(productId);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> updateCartQuantity(
      CartUpdateModel cartModelUpdate) async {
    try {
      await cartRemoteDataSource.updateCartQuantity(cartModelUpdate);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
