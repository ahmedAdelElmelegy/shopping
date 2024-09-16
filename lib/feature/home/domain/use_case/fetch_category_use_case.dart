import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/core/use_case/no_parameter_use_case.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/domain/home_repo/home_Repo.dart';

class FetchCategoryUseCase extends NoParameterUseCase<List<CategoryEntity>> {
  final HomeRepo homeRepo;

  FetchCategoryUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await homeRepo.fetchCategory();
  }
}
