import 'package:dio/dio.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/func/set_up_server_locator.dart';
import 'package:shopping_app/core/style/app_color.dart';
import 'package:shopping_app/core/style/app_text_style.dart';
import 'package:shopping_app/core/utils/api_services.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/core/widgets/custom_loading_indicator.dart';
import 'package:shopping_app/feature/cart/data/cart_Repo_imp/cart_repo_imp.dart';
import 'package:shopping_app/feature/cart/domain/use_case/add_to_cart_user_case.dart';
import 'package:shopping_app/feature/cart/domain/use_case/fetch_cart_use_case.dart';
import 'package:shopping_app/feature/cart/domain/use_case/remove_to_cart_use_case.dart';
import 'package:shopping_app/feature/cart/domain/use_case/update_quantity_to_cart_use_case.dart';
import 'package:shopping_app/feature/cart/presentation/manager/cart_controller.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';
import 'package:shopping_app/feature/home/presentation/view/product_detailes_view.dart';
import 'package:shopping_app/feature/settings/presentation/manager/fetch_favorite_controller.dart';

class ProductItem extends StatelessWidget {
  ProductItem({super.key, required this.productEntity});
  final ProductEntity productEntity;

  CartController cartController = Get.put(CartController(
    updateQuantityToCartUseCase:
        UpdateQuantityToCartUseCase(cartRepo: getIt.get<CartRepoImp>()),
    fetchCartUseCase: FetchCartUseCase(cartRepo: getIt.get<CartRepoImp>()),
    addToCartUserCase: AddToCartUserCase(cartRepo: getIt.get<CartRepoImp>()),
    removeToCartUseCase:
        RemoveToCartUseCase(cartRepo: getIt.get<CartRepoImp>()),
  ));

  FetchFavoriteController fetchFavoriteController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 2,
                  color: Colors.grey.withOpacity(.2),
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            width: 170.w,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(
                      ProductDetailesView(productEntity: productEntity),
                    );
                  },
                  child: FancyShimmerImage(
                    imageUrl: productEntity.productImage,
                    width: 170.w,
                    height: 170.h,
                  ),
                ),
                verticalSpacing(height: 10),
                Text(
                  productEntity.productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.mediumHeader,
                ),
                Text(
                  productEntity.productDescription,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.caption,
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${productEntity.productPrice}',
                        style: AppTextStyles.primarytext,
                      ),
                      InkWell(
                        onTap: () {
                          cartController
                              .addtoCart(productEntity.productId.toInt());
                          if (cartController.loadingProducts
                              .contains(productEntity.productId)) {
                            cartController.fetchCart();
                          }
                        },
                        child: Material(
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          color: AppColor.primarycolor,
                          child: cartController.loadingProducts
                                  .contains(productEntity.productId)
                              ? Padding(
                                  padding: EdgeInsets.all(10.w),
                                  child: SizedBox(
                                    width: 20.w,
                                    height: 20.h,
                                    child: const CustomLoadingIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.all(7.w),
                                  child: cartController.id
                                          .contains(productEntity.productId)
                                      ? const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        )
                                      : const Icon(
                                          Icons.shopping_cart,
                                          color: Colors.white,
                                        ),
                                ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              fetchFavoriteController
                  .addAndRemoveToFavorite(productEntity.productId.toInt());
              fetchFavoriteController.fetchFavorite();
            },
            child: fetchFavoriteController.loading
                    .contains(productEntity.productId)
                ? const CustomLoadingIndicator()
                : Icon(
                    IconlyBold.heart,
                    color: fetchFavoriteController.id
                            .contains(productEntity.productId)
                        ? Colors.red
                        : AppColor.subtitlecolor,
                  ),
          )
        ],
      );
    });
  }
}
