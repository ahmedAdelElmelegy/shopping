import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_app/core/utils/api_services.dart';
import 'package:shopping_app/feature/cart/data/cart_Repo_imp/cart_repo_imp.dart';
import 'package:shopping_app/feature/cart/data/data_source/cart_remote_data_source.dart';
import 'package:shopping_app/feature/home/data/Repo_imp/home_repo_imp.dart';
import 'package:shopping_app/feature/home/data/data_source/home_remote_data_source.dart';

GetIt getIt = GetIt.instance;
void setUpServerLocator() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      )),
    ),
  );
  getIt.registerSingleton<HomeRepoImp>(
    HomeRepoImp(
      homeRemoteDataSource: HomeRemoteDataSourceImp(
        apiServices: getIt.get<ApiServices>(),
      ),
    ),
  );

  getIt.registerSingleton<CartRepoImp>(CartRepoImp(
    cartRemoteDataSource: CartRemoteDataSourceImp(
      apiServices: getIt.get<ApiServices>(),
    ),
  ));
}
