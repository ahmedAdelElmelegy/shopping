import 'package:get/get.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/domain/use_case/fetch_category_use_case.dart';

class CategoryController extends GetxController {
  @override
  void onInit() {
    fetchcategory();
    super.onInit();
  }

  var errorMessage = ''.obs; // Error message for network error
  var isLoading = false.obs;

  final FetchCategoryUseCase fetchCategoryUseCase;

  CategoryController({required this.fetchCategoryUseCase});
  var category = <CategoryEntity>[];
  Future<void> fetchcategory() async {
    isLoading(true);
    try {
      var result = await fetchCategoryUseCase.call();
      result.fold((failure) {
        errorMessage.value = failure.message; // Capture error
        Get.snackbar('Error', failure.message);
      }, (categoryData) {
        category = categoryData;
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
