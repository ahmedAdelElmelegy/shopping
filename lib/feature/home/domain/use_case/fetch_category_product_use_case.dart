import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/core/use_case/parameter_use_case.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';
import 'package:shopping_app/feature/home/domain/home_repo/home_Repo.dart';

class FetchCategoryProductUseCase
    extends ParameterUseCase<List<ProductEntity>, int> {
  final HomeRepo homeRepo;

  FetchCategoryProductUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<ProductEntity>>> call(int parm ) async {
    return await homeRepo.fetchCategoyProduct(categoryId: parm);
  }
}
