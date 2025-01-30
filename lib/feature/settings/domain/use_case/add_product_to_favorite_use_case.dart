import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/core/use_case/parameter_use_case.dart';
import 'package:shopping_app/feature/settings/domain/settings_repo/settings_repo.dart';

class AddProductToFavoriteUseCase extends ParameterUseCase<void, int> {
  final SettingsRepo settingsRepo;

  AddProductToFavoriteUseCase({required this.settingsRepo});

  @override
  Future<Either<Failure, void>> call(int parm) async {
    return await settingsRepo.addToFavorite(parm);
  }
}
