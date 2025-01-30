import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/core/use_case/no_parameter_use_case.dart';
import 'package:shopping_app/feature/settings/domain/entity/favorite_All_data.dart';
import 'package:shopping_app/feature/settings/domain/entity/favorite_entity.dart';
import 'package:shopping_app/feature/settings/domain/settings_repo/settings_repo.dart';

class FetchFavoriteUseCase extends NoParameterUseCase<FavoriteAllData> {
  final SettingsRepo settingsRepo;

  FetchFavoriteUseCase({required this.settingsRepo});

  @override
  Future<Either<Failure, FavoriteAllData>> call() async {
    return await settingsRepo.fetchFavorite();
  }
}
