import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/style/app_text_style.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/feature/cart/presentation/manager/cart_controller.dart';
import 'package:shopping_app/feature/settings/domain/entity/favorite_entity.dart';
import 'package:shopping_app/feature/settings/presentation/manager/fetch_favorite_controller.dart';

class FavoriteItem extends StatelessWidget {
  FavoriteItem({super.key, required this.favoriteEntity});
  final FavoriteEntity favoriteEntity;

  FetchFavoriteController favoriteController = Get.find();
  CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchFavoriteController>(builder: (favoriteController) {
      if (!favoriteController.id.contains(favoriteEntity.productId)) {
        return const SizedBox();
      }

      return Container(
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              favoriteEntity.productImage,
              width: 100.w,
              height: 130.h,
            ),
            horizontalSpacing(width: 10),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          favoriteEntity.productName,
                          maxLines: 1,
                          style: AppTextStyles.mediumHeader,
                        ),
                        Text(
                          favoriteEntity.productDesc,
                          maxLines: 1,
                          style: AppTextStyles.smallHeader,
                        ),
                        verticalSpacing(height: 16),
                        SizedBox(
                          width: 130.w,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            '\$ ${favoriteEntity.productPrice.toString()}',
                            style: AppTextStyles.mediumHeaderprimary,
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          favoriteController.addAndRemoveToFavorite(
                              favoriteEntity.productId.toInt());
                        },
                        child: const Icon(
                          IconlyBold.delete,
                          color: Colors.red,
                        ),
                      ),
                      verticalSpacing(height: 50.h),
                      GetBuilder<CartController>(builder: (cartController) {
                        return InkWell(
                          onTap: () {
                            cartController
                                .addtoCart(favoriteEntity.productId.toInt());
                            cartController.fetchCart();
                          },
                          child: Material(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(16.r),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                cartController.id
                                        .contains(favoriteEntity.productId)
                                    ? Icons.check
                                    : Icons.shopping_cart,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
