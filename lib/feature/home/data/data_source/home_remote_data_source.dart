import 'package:shopping_app/core/utils/api_services.dart';
import 'package:shopping_app/feature/home/data/models/banner_model.dart';
import 'package:shopping_app/feature/home/data/models/category_model.dart';
import 'package:shopping_app/feature/home/data/models/product_model.dart';
import 'package:shopping_app/feature/home/domain/entities/banner_entity.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BannerEntity>> fetchBanners();
  Future<List<CategoryEntity>> fetchCategory();
    Future<List<ProductEntity>> fetchProduct();
  Future<List<ProductEntity>> fetchCategoryProduct({int categoryId=0});
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImp({required this.apiServices});
  @override
  Future<List<BannerEntity>> fetchBanners() async {
    final response = await apiServices.get(endPoint: 'banners');
    List<BannerEntity> banners = [];
    for (var element in response['data']) {
      banners.add(BannerModel.fromJson(element));
    }
    return banners;
  }

  @override
  Future<List<CategoryEntity>> fetchCategory() async {
    Map<String, dynamic> response =
        await apiServices.get(endPoint: 'categories');
    List<CategoryEntity> category = [];
    for (var element in response['data']['data']) {
      category.add(CategoryModel.fromJson(element));
    }
    return category;
  }

  @override
  Future<List<ProductEntity>> fetchProduct() async {
    Map<String, dynamic> response =
        await apiServices.get(endPoint: 'products');
    List<ProductEntity> products = [];
    for (var element in response['data']['data']) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }
  
  @override
  Future<List<ProductEntity>> fetchCategoryProduct({int categoryId = 0})async {
    Map<String, dynamic> response =
        await apiServices.get(endPoint: 'products?category_id=$categoryId');
    List<ProductEntity> products = [];
    for (var element in response['data']['data']) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }
}
