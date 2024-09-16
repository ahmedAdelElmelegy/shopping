import 'package:get/get.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';
import 'package:shopping_app/feature/home/domain/use_case/fetch_category_product_use_case.dart';

class FetchCategoryProductController extends GetxController {
  @override
  void onInit() {
    // fetchCategoryProducts();
    super.onInit();
  }

  var isLoading = false.obs;

  final FetchCategoryProductUseCase fetchCategoryProductUseCase;

  FetchCategoryProductController({required this.fetchCategoryProductUseCase});
  var products = <ProductEntity>[];
  Future<void> fetchCategoryProducts({int categoryId = 0}) async {
    isLoading(true);
    try {
      var result = await fetchCategoryProductUseCase.call(categoryId);
      result.fold((failure) => Get.snackbar('Error', failure.message),
          (productData) {
        products = productData;
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
