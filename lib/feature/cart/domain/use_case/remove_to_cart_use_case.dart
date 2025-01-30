import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/core/use_case/parameter_use_case.dart';
import 'package:shopping_app/feature/cart/domain/cart_Repo/cart_repo.dart';

class RemoveToCartUseCase extends ParameterUseCase<void, int> {
  final CartRepo cartRepo;

  RemoveToCartUseCase({required this.cartRepo});
  @override
  Future<Either<Failure, void>> call(int parm) {
    return cartRepo.removeToCart(parm);
  }
}
