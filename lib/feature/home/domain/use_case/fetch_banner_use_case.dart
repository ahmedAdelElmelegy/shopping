import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/core/use_case/no_parameter_use_case.dart';
import 'package:shopping_app/feature/home/domain/entities/banner_entity.dart';
import 'package:shopping_app/feature/home/domain/home_repo/home_Repo.dart';

class FetchBannerUseCase extends NoParameterUseCase<List<BannerEntity>> {
  final HomeRepo homeRepo;

  FetchBannerUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<BannerEntity>>> call() async {
    return await homeRepo.fetchBanners();
  }
}
