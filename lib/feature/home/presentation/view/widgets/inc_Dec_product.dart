import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/style/app_color.dart';
import 'package:shopping_app/core/style/app_text_style.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/feature/cart/domain/entites/cart_update.dart';
import 'package:shopping_app/feature/cart/presentation/manager/cart_controller.dart';

class IncDecProduct extends StatelessWidget {
  final int quantity;
  final int index;
  CartController cartController = Get.find();
  IncDecProduct({
    super.key,
    required this.quantity,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColor.subtitlecolor),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          InkWell(
              onTap: () {
                if (cartController.productQuantity[index] > 1) {
                  print(cartController.productQuantity[index]);
                  cartController.updateCart(
                      cartupdatemodel: CartUpdateModel(
                          cartId: cartController.cart_id[index],
                          quantity: cartController.productQuantity[index] - 1));
                  cartController.fetchCart();
                }

                print(cartController.productQuantity[index]);
              },
              child: const Icon(Icons.remove)),
          horizontalSpacing(width: 5),
          Text(
            '${quantity}',
            style: AppTextStyles.mediumHeader,
          ),
          horizontalSpacing(width: 5),
          InkWell(
              onTap: () {
                cartController.updateCart(
                    cartupdatemodel: CartUpdateModel(
                        cartId: cartController.cart_id[index],
                        quantity: cartController.productQuantity[index] + 1));
                cartController.fetchCart();
              },
              child: const Icon(Icons.add))
        ],
      ),
    );
  }
}
