import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/core/use_case/no_parameter_use_case.dart';
import 'package:shopping_app/core/use_case/parameter_use_case.dart';
import 'package:shopping_app/feature/cart/domain/cart_Repo/cart_repo.dart';
import 'package:shopping_app/feature/cart/domain/entites/cart_update.dart';

class UpdateQuantityToCartUseCase
    extends ParameterUseCase<void, CartUpdateModel> {
  final CartRepo cartRepo;

  UpdateQuantityToCartUseCase({required this.cartRepo});

  @override
  Future<Either<Failure, void>> call(CartUpdateModel parm) {
    return cartRepo.updateCartQuantity(parm);
  }
}
