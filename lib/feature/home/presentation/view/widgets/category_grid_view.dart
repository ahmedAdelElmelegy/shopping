import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/widgets/custom_loading_indicator.dart';
import 'package:shopping_app/feature/home/presentation/manager/fetch_category_product_controller.dart';
import 'package:shopping_app/feature/home/presentation/manager/product_controller.dart';
import 'package:shopping_app/feature/home/presentation/view/widgets/product_item.dart';

class CategoryGridView extends StatelessWidget {
  CategoryGridView({super.key});
  FetchCategoryProductController categoryProductController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (categoryProductController.isLoading.value) {
        return const CustomLoadingIndicator();
      } else if (categoryProductController.products.isNotEmpty) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: DynamicHeightGridView(
              builder: (context, index) => IntrinsicHeight(
                      child: ProductItem(
                    productEntity: categoryProductController.products[index],
                  )),
              itemCount: categoryProductController.products.length,
              crossAxisCount: 2),
        );
      } else {
        return const Text('The List is Empty');
      }
    });
  }
}
