import 'package:get/get.dart';
import 'package:shopping_app/core/func/set_up_server_locator.dart';
import 'package:shopping_app/core/utils/api_services.dart';
import 'package:shopping_app/feature/cart/data/cart_Repo_imp/cart_repo_imp.dart';
import 'package:shopping_app/feature/cart/data/data_source/cart_remote_data_source.dart';
import 'package:shopping_app/feature/cart/domain/use_case/add_to_cart_user_case.dart';
import 'package:shopping_app/feature/cart/domain/use_case/fetch_cart_use_case.dart';
import 'package:shopping_app/feature/cart/domain/use_case/remove_to_cart_use_case.dart';
import 'package:shopping_app/feature/cart/domain/use_case/update_quantity_to_cart_use_case.dart';
import 'package:shopping_app/feature/cart/presentation/manager/cart_controller.dart';
import 'package:shopping_app/feature/home/data/Repo_imp/home_repo_imp.dart';
import 'package:shopping_app/feature/home/domain/use_case/fetch_banner_use_case.dart';
import 'package:shopping_app/feature/home/domain/use_case/fetch_category_product_use_case.dart';
import 'package:shopping_app/feature/home/domain/use_case/fetch_category_use_case.dart';
import 'package:shopping_app/feature/home/domain/use_case/fetch_product_use_case.dart';
import 'package:shopping_app/feature/home/presentation/manager/banner_controller.dart';
import 'package:shopping_app/feature/home/presentation/manager/category_controller.dart';
import 'package:shopping_app/feature/home/presentation/manager/fetch_category_product_controller.dart';
import 'package:shopping_app/feature/home/presentation/manager/product_controller.dart';
import 'package:shopping_app/feature/settings/data/data_source/settings_data_source.dart';
import 'package:shopping_app/feature/settings/data/settings_repo_imp/settings_repo_imp.dart';
import 'package:shopping_app/feature/settings/domain/settings_repo/settings_repo.dart';
import 'package:shopping_app/feature/settings/domain/use_case/add_product_to_favorite_use_case.dart';
import 'package:shopping_app/feature/settings/domain/use_case/fetch_favorite_use_case.dart';
import 'package:shopping_app/feature/settings/domain/use_case/fetch_user_data_use_case.dart';
import 'package:shopping_app/feature/settings/domain/use_case/update_profile_use_case.dart';
import 'package:shopping_app/feature/settings/presentation/manager/fetch_favorite_controller.dart';
import 'package:shopping_app/feature/settings/presentation/manager/fetch_profie_controller.dart';
import 'package:shopping_app/feature/settings/presentation/manager/update_profile_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => BannerController(
        fetchBannerUseCase:
            FetchBannerUseCase(homeRepo: getIt.get<HomeRepoImp>()),
      ),
    );
    Get.lazyPut(
      () => CategoryController(
        fetchCategoryUseCase:
            FetchCategoryUseCase(homeRepo: getIt.get<HomeRepoImp>()),
      ),
    );
    Get.lazyPut(
      () => ProductController(
        fetchProductUseCase:
            FetchProductUseCase(homeRepo: getIt.get<HomeRepoImp>()),
      ),
    );
    Get.lazyPut(
      () => FetchCategoryProductController(
        fetchCategoryProductUseCase:
            FetchCategoryProductUseCase(homeRepo: getIt.get<HomeRepoImp>()),
      ),
    );
    Get.lazyPut(() => FetchProfieController(
          fetchUserDataUseCase: FetchUserDataUseCase(
            settingsRepo: SettingsRepoImp(
              settingsDataSource:
                  SettingsDataSourceImp(apiServices: getIt.get<ApiServices>()),
            ),
          ),
        ));
    Get.lazyPut(
        () => UpdateProfileController(
              updateProfileUseCase: UpdateProfileUseCase(
                settingsRepo: SettingsRepoImp(
                  settingsDataSource: SettingsDataSourceImp(
                      apiServices: getIt.get<ApiServices>()),
                ),
              ),
            ),
        fenix: true);
    Get.lazyPut(
      fenix: true,
      () => FetchFavoriteController(
        addProductToFavoriteUseCase: AddProductToFavoriteUseCase(
          settingsRepo: SettingsRepoImp(
            settingsDataSource: SettingsDataSourceImp(
              apiServices: getIt.get<ApiServices>(),
            ),
          ),
        ),
        favoriteUseCase: FetchFavoriteUseCase(
          settingsRepo: SettingsRepoImp(
            settingsDataSource:
                SettingsDataSourceImp(apiServices: getIt.get<ApiServices>()),
          ),
        ),
      ),
    );
    // Get.lazyPut(
    //   () => CartController(
    //     removeToCartUseCase:
    //         RemoveToCartUseCase(cartRepo: getIt.get<CartRepoImp>()),
    //     addToCartUserCase:
    //         AddToCartUserCase(cartRepo: getIt.get<CartRepoImp>()),
    //     fetchCartUseCase: FetchCartUseCase(
    //       cartRepo: getIt.get<CartRepoImp>(),
    //     ),
    //     updateQuantityToCartUseCase:
    //         UpdateQuantityToCartUseCase(cartRepo: getIt.get<CartRepoImp>()),
    //   ),
    // );
  }
}
