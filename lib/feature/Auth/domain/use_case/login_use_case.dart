import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/core/use_case/parameter_use_case.dart';
import 'package:shopping_app/feature/Auth/domain/Auth_Rep/Auth_Repo.dart';
import 'package:shopping_app/feature/Auth/domain/entities/login_entity.dart';
import 'package:shopping_app/feature/Auth/data/model/user_data.dart';

class LoginUseCase extends ParameterUseCase<UserData, LoginEntity> {
  final AuthRepo authRepo;

  LoginUseCase({required this.authRepo});
  @override
  Future<Either<Failure, UserData>> call(LoginEntity logindata) async {
    return await authRepo.login(logindata);
  }
}
