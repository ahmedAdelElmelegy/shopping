import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/style/app_text_style.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/core/widgets/custom_loading_indicator.dart';
import 'package:shopping_app/feature/cart/presentation/manager/cart_controller.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';
import 'package:shopping_app/feature/home/presentation/view/widgets/inc_Dec_product.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {super.key,
      required this.productEntity,
      required this.index,
      required this.quantity});
  final ProductEntity productEntity;
  final int index;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();

    return GetBuilder<CartController>(builder: (cartController) {
      if (!cartController.id.contains(productEntity.productId) &&
          !cartController.id.contains(cartController.cart[index].productId)) {
        return const SizedBox.shrink();
      }

      return Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 10,
              offset: Offset(0, 5), // Changes position of the shadow
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                productEntity.productImage,
                width: 70.w,
                height: 70.h,
                fit: BoxFit.cover,
              ),
            ),
            horizontalSpacing(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productEntity.productName,
                    style: AppTextStyles.mediumHeader.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpacing(height: 5.h),

                  // Product Description
                  Text(
                    productEntity.productDescription,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.smallHeader.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  verticalSpacing(height: 10.h),

                  Text(
                    '\$${productEntity.productPrice}',
                    style: AppTextStyles.mediumHeaderprimary.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Delete Button with smooth loading transition
                IconButton(
                  icon: cartController.loadingProducts
                          .contains(productEntity.productId)
                      ? const CustomLoadingIndicator()
                      : const Icon(IconlyBold.delete, color: Colors.red),
                  onPressed: () {
                    if (!cartController.loadingProducts
                        .contains(productEntity.productId)) {
                      cartController
                          .removeCart(productEntity.productId.toInt());
                    }
                  },
                ),
                // Favorite Icon with a more muted color

                verticalSpacing(height: 10.h),
                // Inc/Dec Product Widget (aligned with better spacing)
                IncDecProduct(
                  index: index,
                  quantity: quantity,
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
