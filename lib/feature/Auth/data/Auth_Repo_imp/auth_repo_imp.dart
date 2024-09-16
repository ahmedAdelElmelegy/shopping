import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/feature/Auth/data/data_Source/Auth_data_source.dart';
import 'package:shopping_app/feature/Auth/data/model/user_data.dart';
import 'package:shopping_app/feature/Auth/domain/Auth_Rep/Auth_Repo.dart';
import 'package:shopping_app/feature/Auth/domain/entities/change_password_entity.dart';
import 'package:shopping_app/feature/Auth/domain/entities/login_entity.dart';
import 'package:shopping_app/feature/Auth/domain/entities/sign_up_entity.dart';

class AuthRepoImp extends AuthRepo {
  final AuthDataSource authDataSource;

  AuthRepoImp({required this.authDataSource});
  @override
  Future<Either<Failure, UserData>> login(LoginEntity login) async {
    try {
      UserData userData = await authDataSource.login(login);
      return right(userData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserData>> signUp(SignUpEntity signUp) async {
    try {
      UserData userData = await authDataSource.signUp(signUp);
      return right(userData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> changePassword(
      ChangePasswordEntity passworddata) async {
    try {
      await authDataSource.changePassword(passworddata);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
