import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/feature/settings/domain/entity/favorite_All_data.dart';
import 'package:shopping_app/feature/settings/domain/entity/user_entity.dart';

abstract class SettingsRepo {
  Future<Either<Failure, UserEntity>> fetchProfile();
  Future<Either<Failure, FavoriteAllData>> fetchFavorite();
  Future<Either<Failure, void>> updateProfile(UserEntity user);
  Future<Either<Failure, void>> addToFavorite(int productId);
}
