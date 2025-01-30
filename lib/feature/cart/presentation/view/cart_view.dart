import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/func/set_up_server_locator.dart';
import 'package:shopping_app/core/style/app_text_style.dart';
import 'package:shopping_app/core/widgets/custom_button.dart';
import 'package:shopping_app/feature/cart/data/cart_Repo_imp/cart_repo_imp.dart';
import 'package:shopping_app/feature/cart/domain/use_case/add_to_cart_user_case.dart';
import 'package:shopping_app/feature/cart/domain/use_case/fetch_cart_use_case.dart';
import 'package:shopping_app/feature/cart/domain/use_case/remove_to_cart_use_case.dart';
import 'package:shopping_app/feature/cart/domain/use_case/update_quantity_to_cart_use_case.dart';
import 'package:shopping_app/feature/cart/presentation/manager/cart_controller.dart';
import 'package:shopping_app/feature/cart/presentation/view/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController(
        updateQuantityToCartUseCase:
            UpdateQuantityToCartUseCase(cartRepo: getIt.get<CartRepoImp>()),
        fetchCartUseCase: FetchCartUseCase(cartRepo: getIt.get<CartRepoImp>()),
        addToCartUserCase:
            AddToCartUserCase(cartRepo: getIt.get<CartRepoImp>()),
        removeToCartUseCase:
            RemoveToCartUseCase(cartRepo: getIt.get<CartRepoImp>())));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart(${cartController.cart.length})',
          style: AppTextStyles.mediumHeader,
        ),
        centerTitle: true,
      ),
      body: CartViewBody(),
      bottomSheet: PricingCheckoutWidget(
        controller: cartController,
      ),
    );
  }
}

class PricingCheckoutWidget extends StatelessWidget {
  const PricingCheckoutWidget({super.key, required this.controller});
  final CartController controller;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey, width: 1))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Total',
                    style: AppTextStyles.largeHeader,
                  ),
                  Text(
                    '\$${controller.totalPrice}',
                    style: AppTextStyles.mediumHeaderprimary
                        .copyWith(color: Colors.blue),
                  )
                ],
              ),
              CustomButton(
                onPessend: () {},
                height: 50.h,
                width: 100.w,
                text: 'Checkout',
              )
            ],
          ),
        ),
      ),
    );
  }
}
