import 'package:get/get.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';
import 'package:shopping_app/feature/home/domain/use_case/fetch_product_use_case.dart';

class ProductController extends GetxController {
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  var errorMessage = ''.obs; // Error message for network error
  var isLoading = false.obs;

  final FetchProductUseCase fetchProductUseCase;

  ProductController({required this.fetchProductUseCase});
  var products = <ProductEntity>[];
  Future<void> fetchProducts() async {
    isLoading(true);
    try {
      var result = await fetchProductUseCase.call();
      result.fold((failure) {
        errorMessage.value = failure.message; // Capture error
      }, (productData) {
        products = productData;
      });
    } catch (e) {
      errorMessage.value = 'Unexpected error occurred';
    } finally {
      isLoading(false);
    }
  }

  RxString currentImage = ''.obs;

  void changeImage(String image) {
    currentImage.value = image;
  }

  // var searchQurey = ''.obs;
  var filterList = <ProductEntity>[].obs;
  void searchProduct(String searchQuery) async {
    filterList.value = products.where(
      (item) {
        return item.productName
            .toLowerCase()
            .contains(searchQuery.toLowerCase());
      },
    ).toList();
    update();
  }
}
