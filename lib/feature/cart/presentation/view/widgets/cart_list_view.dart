import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/func/set_up_server_locator.dart';
import 'package:shopping_app/core/widgets/network_error_widget.dart';
import 'package:shopping_app/feature/cart/data/cart_Repo_imp/cart_repo_imp.dart';
import 'package:shopping_app/feature/cart/domain/use_case/add_to_cart_user_case.dart';
import 'package:shopping_app/feature/cart/domain/use_case/fetch_cart_use_case.dart';
import 'package:shopping_app/feature/cart/domain/use_case/remove_to_cart_use_case.dart';
import 'package:shopping_app/feature/cart/domain/use_case/update_quantity_to_cart_use_case.dart';
import 'package:shopping_app/feature/cart/presentation/manager/cart_controller.dart';
import 'package:shopping_app/feature/cart/presentation/view/widgets/cart_item.dart';
import 'package:shopping_app/feature/cart/presentation/view/widgets/empty_cart.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartListView extends StatefulWidget {
  const CartListView({super.key});

  @override
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  CartController cartController = Get.put(CartController(
    fetchCartUseCase: FetchCartUseCase(cartRepo: getIt.get<CartRepoImp>()),
    addToCartUserCase: AddToCartUserCase(cartRepo: getIt.get<CartRepoImp>()),
    removeToCartUseCase:
        RemoveToCartUseCase(cartRepo: getIt.get<CartRepoImp>()),
    updateQuantityToCartUseCase:
        UpdateQuantityToCartUseCase(cartRepo: getIt.get<CartRepoImp>()),
  ));

  @override
  void initState() {
    cartController.fetchCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (cartController.errorMessage.value.isNotEmpty) {
        return NetworkErrorWidget(
          message: cartController.errorMessage.value,
          onRetry: () {
            cartController.errorMessage.value = '';
            cartController.fetchCart();
          },
        );
      }

      if (cartController.isLoading.value) {
        return ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Skeletonizer(
              enabled: true,
              child: Container(
                width: double.infinity,
                height: 120.h,
                color: Colors.grey[300],
              ),
            ),
          ),
        );
      } else if (cartController.cart.isEmpty) {
        return const EmptyCart();
      }

      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartController.cart.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: CartItem(
                  quantity: cartController.productQuantity[index],
                  index: index,
                  productEntity: cartController.cart[index],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
