import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/core/use_case/parameter_use_case.dart';
import 'package:shopping_app/feature/Auth/data/model/user_data.dart';
import 'package:shopping_app/feature/Auth/domain/Auth_Rep/Auth_Repo.dart';
import 'package:shopping_app/feature/Auth/domain/entities/sign_up_entity.dart';

class SignUpUseCase extends ParameterUseCase<UserData, SignUpEntity> {
  final AuthRepo authRepo;

  SignUpUseCase({required this.authRepo});

  @override
  Future<Either<Failure, UserData>> call(SignUpEntity signUpEntity) {
    return authRepo.signUp(signUpEntity);
  }
}
