import 'package:get/get.dart';
import 'package:shopping_app/feature/cart/domain/use_case/add_to_cart_user_case.dart';
import 'package:shopping_app/feature/cart/domain/use_case/fetch_cart_use_case.dart';
import 'package:shopping_app/feature/cart/domain/use_case/remove_to_cart_use_case.dart';
import 'package:shopping_app/feature/cart/presentation/view/cart_view.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';

class CartController extends GetxController {
  @override
  void onInit() {
    fetchCart();
    super.onInit();
  }

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  Set<int> loadingProducts = <int>{}.obs;
  final FetchCartUseCase fetchCartUseCase;

  final AddToCartUserCase addToCartUserCase;
  final RemoveToCartUseCase removeToCartUseCase;
  CartController(
      {required this.fetchCartUseCase,
      required this.addToCartUserCase,
      required this.removeToCartUseCase});
  var cart = <ProductEntity>[];
  Set<int> id = <int>{};
  Future<void> fetchCart() async {
    isLoading(true);
    try {
      var result = await fetchCartUseCase.call();
      result.fold(
        (failure) {
          errorMessage.value = failure.message;
        },
        (cartalldata) {
          cart = cartalldata.product;
          id = cartalldata.id;
        },
      );
    } finally {
      isLoading(false);
    }
  }

  void addtoCart(int productId) async {
    try {
      if (id.contains(productId)) {
        print('inCart');
      } else {
        loadingProducts.add(productId);

        id.add(productId);
        var result = await addToCartUserCase.call(productId);
        update();
        result.fold(
          (failure) {
            errorMessage.value = failure.message;
          },
          (sucess) {
            print('add to cart sucess');
          },
        );
      }
    } finally {
      loadingProducts.remove(productId);
    }
  }

  void removeCart(int productId) async {
    if (id.contains(productId)) {
      loadingProducts.add(productId);
      var result = await addToCartUserCase.call(productId);
      update();

      result.fold(
        (failure) {
          errorMessage.value = failure.message;
          update();
        },
        (success) {
          id.remove(productId);

          print('Remove success');
          update();
        },
      );

      loadingProducts.remove(productId); // Remove loading state
      update();
    }
  }
}