import 'package:get/get.dart';
import 'package:shopping_app/feature/settings/domain/entity/favorite_entity.dart';
import 'package:shopping_app/feature/settings/domain/use_case/add_product_to_favorite_use_case.dart';
import 'package:shopping_app/feature/settings/domain/use_case/fetch_favorite_use_case.dart';

class FetchFavoriteController extends GetxController {
  @override
  void onInit() {
    fetchFavorite();
    super.onInit();
  }

  var favorite = <FavoriteEntity>[];
  var isLoading = false.obs;
  var error = ''.obs;
  final FetchFavoriteUseCase favoriteUseCase;
  final AddProductToFavoriteUseCase addProductToFavoriteUseCase;
  var id = <num>{}.obs; // Make the ID list reactive
  var loading = <num>{}.obs; // Track loading state for specific products
  FetchFavoriteController(
      {required this.favoriteUseCase,
      required this.addProductToFavoriteUseCase});

  Future<void> fetchFavorite() async {
    isLoading(true);
    try {
      var result = await favoriteUseCase.call();
      result.fold(
        (failure) {
          error.value = failure.message;
        },
        (favoriteList) {
          favorite = favoriteList.favorite;
          id.value = favoriteList.id;
        },
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> addAndRemoveToFavorite(int productId) async {
    try {
      loading.add(productId); // Mark the product as loading
      final result = await addProductToFavoriteUseCase.call(productId);
      result.fold(
        (failure) {
          error.value = failure.message; // Handle failure case
          update();
        },
        (success) {
          if (id.contains(productId)) {
            id.remove(productId);
            print('Product removed from favorite');
          } else {
            id.add(productId);
            print('Product added to favorite');
          }
          update();
        },
      );
    } finally {
      loading.remove(productId);
      update();
    }
  }
}
