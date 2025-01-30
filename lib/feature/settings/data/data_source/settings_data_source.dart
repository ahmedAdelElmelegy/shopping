import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/core/utils/api_services.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';
import 'package:shopping_app/feature/settings/data/models/favorite_model/favorite_model.dart';
import 'package:shopping_app/feature/settings/data/models/user_model.dart';
import 'package:shopping_app/feature/settings/domain/entity/favorite_All_data.dart';
import 'package:shopping_app/feature/settings/domain/entity/favorite_entity.dart';
import 'package:shopping_app/feature/settings/domain/entity/user_entity.dart';

abstract class SettingsDataSource {
  Future<UserEntity> fetchProfile();
  Future<void> updateProfile(UserEntity userenitiy);
  Future<FavoriteAllData> fetchFavorite();

  Future<void> addToFavorite(int productId);
}

class SettingsDataSourceImp extends SettingsDataSource {
  final ApiServices apiServices;

  SettingsDataSourceImp({required this.apiServices});
  @override
  Future<UserEntity> fetchProfile() async {
    final response = await apiServices.get(endPoint: 'profile');
    UserEntity userEntity = UserModel.fromJson(response['data']);
    return userEntity;
  }

  @override
  Future<void> updateProfile(UserEntity userenitiy) async {
    final response = await apiServices.put(endPoint: 'update-profile', body: {
      'email': userenitiy.email,
      'name': userenitiy.name,
      'phone': userenitiy.phone,
    });
  }

  @override
  Future<FavoriteAllData> fetchFavorite() async {
    final response = await apiServices.get(endPoint: 'favorites');
    Set<num> id = {};
    List<FavoriteEntity> product = [];
    for (var element in response['data']['data']) {
      product.add(FavoriteModel.fromJson(element));
      id.add(element['product']['id']);
    }
    return FavoriteAllData(favorite: product, id: id);
  }

  @override
  Future<void> addToFavorite(int productId) async {
    final response = await apiServices.post(
      endPoint: 'favorites?product_id=$productId',
    );
  }
}
