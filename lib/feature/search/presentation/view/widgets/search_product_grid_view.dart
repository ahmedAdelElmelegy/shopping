import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/widgets/custom_loading_indicator.dart';
import 'package:shopping_app/feature/home/presentation/manager/product_controller.dart';
import 'package:shopping_app/feature/home/presentation/view/widgets/product_item.dart';

class SearchProductGridView extends StatelessWidget {
  SearchProductGridView({super.key});
  ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.isLoading.value) {
        return const CustomLoadingIndicator();
      } else if (productController.products.isNotEmpty) {
        return DynamicHeightGridView(
            builder: (context, index) => IntrinsicHeight(
                    child: ProductItem(
                  productEntity: productController.filterList.isNotEmpty
                      ? productController.filterList[index]
                      : productController.products[index],
                )),
            itemCount: productController.filterList.isNotEmpty
                ? productController.filterList.length
                : productController.products.length,
            crossAxisCount: 2);
      } else {
        return const Text('The List is Empty');
      }
    });
  }
}
