import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/core/use_case/no_parameter_use_case.dart';
import 'package:shopping_app/core/use_case/parameter_use_case.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';
import 'package:shopping_app/feature/home/domain/home_repo/home_Repo.dart';

class FetchProductUseCase extends NoParameterUseCase<List<ProductEntity> > {
  final HomeRepo homeRepo;

  FetchProductUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<ProductEntity>>> call() async {
    return await homeRepo.fetchProduct( );
  }
}
