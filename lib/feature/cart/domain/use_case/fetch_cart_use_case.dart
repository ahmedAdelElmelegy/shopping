import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/core/use_case/no_parameter_use_case.dart';
import 'package:shopping_app/feature/cart/domain/cart_Repo/cart_repo.dart';
import 'package:shopping_app/feature/cart/domain/entites/cart_product_result.dart';

class FetchCartUseCase extends NoParameterUseCase<CartProductResult> {
  final CartRepo cartRepo;

  FetchCartUseCase({required this.cartRepo});
  @override
  Future<Either<Failure, CartProductResult>> call() async {
    return await cartRepo.fetchCart();
  }
}
