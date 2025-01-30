import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/feature/settings/data/data_source/settings_data_source.dart';
import 'package:shopping_app/feature/settings/domain/entity/favorite_All_data.dart';
import 'package:shopping_app/feature/settings/domain/entity/favorite_entity.dart';
import 'package:shopping_app/feature/settings/domain/entity/user_entity.dart';
import 'package:shopping_app/feature/settings/domain/settings_repo/settings_repo.dart';

class SettingsRepoImp extends SettingsRepo {
  final SettingsDataSource settingsDataSource;

  SettingsRepoImp({required this.settingsDataSource});

  @override
  Future<Either<Failure, UserEntity>> fetchProfile() async {
    try {
      UserEntity userEntity;
      userEntity = await settingsDataSource.fetchProfile();
      return right(userEntity);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> updateProfile(UserEntity user) async {
    try {
      await settingsDataSource.updateProfile(user);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, FavoriteAllData>> fetchFavorite() async {
    try {
      FavoriteAllData favoriteAllData;
      favoriteAllData = await settingsDataSource.fetchFavorite();
      return right(favoriteAllData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> addToFavorite(int productId) async {
    try {
      await settingsDataSource.addToFavorite(productId);
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
