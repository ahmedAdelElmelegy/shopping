import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/error/failure.dart';
import 'package:shopping_app/feature/home/domain/entities/banner_entity.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BannerEntity>>> fetchBanners();
  Future<Either<Failure, List<CategoryEntity>>> fetchCategory();
  Future<Either<Failure, List<ProductEntity>>> fetchProduct();

  Future<Either<Failure, List<ProductEntity>>> fetchCategoyProduct(
      {int categoryId = 0});
}
