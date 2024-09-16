import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/feature/Auth/domain/entities/change_password_entity.dart';
import 'package:shopping_app/feature/Auth/domain/entities/login_entity.dart';
import 'package:shopping_app/feature/Auth/domain/entities/sign_up_entity.dart';
import 'package:shopping_app/feature/Auth/data/model/user_data.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserData>> login(LoginEntity login);

  Future<Either<Failure, UserData>> signUp(SignUpEntity signUp);
  Future<Either<Failure, void>> changePassword(
      ChangePasswordEntity passworddata);
}
