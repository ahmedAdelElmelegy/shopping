import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/widgets/custom_loading_indicator.dart';
import 'package:shopping_app/feature/cart/presentation/manager/cart_controller.dart';
import 'package:shopping_app/feature/home/presentation/manager/product_controller.dart';
import 'package:shopping_app/feature/home/presentation/view/widgets/product_item.dart';

class ProductgridView extends StatelessWidget {
  ProductgridView({
    super.key,
  });
  ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.isLoading.value) {
        return const SliverToBoxAdapter(
          child: CustomLoadingIndicator(),
        );
      } else if (productController.products.isNotEmpty) {
        return SliverGrid.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.w / 3.7.h,
              mainAxisSpacing: 10.w,
              crossAxisSpacing: 10.h),
          itemCount: productController.products.length,
          itemBuilder: (context, index) => ProductItem(
            productEntity: productController.products[index],
          ),
        );
      } else {
        return const SliverToBoxAdapter(
          child: Text('The Product List is Empty'),
        );
      }
    });
  }
}
