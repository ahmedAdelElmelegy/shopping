import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/core/use_case/parameter_use_case.dart';
import 'package:shopping_app/feature/Auth/domain/Auth_Rep/Auth_Repo.dart';
import 'package:shopping_app/feature/Auth/domain/entities/change_password_entity.dart';

class ChangePasswordUseCase
    extends ParameterUseCase<void, ChangePasswordEntity> {
  final AuthRepo authRepo;

  ChangePasswordUseCase({required this.authRepo});

  @override
  Future<Either<Failure, void>> call(ChangePasswordEntity parm) async {
    return await authRepo.changePassword(parm);
  }
}
