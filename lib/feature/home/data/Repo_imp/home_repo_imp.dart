import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:shopping_app/feature/home/domain/entities/banner_entity.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';
import 'package:shopping_app/feature/home/domain/home_repo/home_Repo.dart';

class HomeRepoImp extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImp({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<BannerEntity>>> fetchBanners() async {
    try {
      List<BannerEntity> banners;
      banners = await homeRemoteDataSource.fetchBanners();
      return right(banners);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> fetchCategory() async {
    try {
      List<CategoryEntity> category;
      category = await homeRemoteDataSource.fetchCategory();
      return right(category);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchProduct() async {
    try {
      List<ProductEntity> products;
      products = await homeRemoteDataSource.fetchProduct();
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchCategoyProduct(
      {int categoryId = 0}) async {
    try {
      List<ProductEntity> products;
      products = await homeRemoteDataSource.fetchCategoryProduct(
          categoryId: categoryId);
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
