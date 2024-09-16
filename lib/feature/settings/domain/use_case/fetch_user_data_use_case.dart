import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/core/use_case/no_parameter_use_case.dart';
import 'package:shopping_app/feature/settings/domain/entity/user_entity.dart';
import 'package:shopping_app/feature/settings/domain/settings_repo/settings_repo.dart';

class FetchUserDataUseCase extends NoParameterUseCase<UserEntity> {
  final SettingsRepo settingsRepo;

  FetchUserDataUseCase({required this.settingsRepo});
  @override
  Future<Either<Failure, UserEntity>> call()async {
    return await settingsRepo.fetchProfile();
  }
}
