
import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/core/use_case/parameter_use_case.dart';
import 'package:shopping_app/feature/settings/domain/entity/user_entity.dart';
import 'package:shopping_app/feature/settings/domain/settings_repo/settings_repo.dart';

class UpdateProfileUseCase extends ParameterUseCase<void, UserEntity> {
  final SettingsRepo settingsRepo;

  UpdateProfileUseCase({required this.settingsRepo});
  @override
  Future<Either<Failure, void>> call(UserEntity parm) {
    return settingsRepo.updateProfile(parm);
  }
}
