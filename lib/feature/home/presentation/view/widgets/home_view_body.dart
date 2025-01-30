import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/core/widgets/network_error_widget.dart';
import 'package:shopping_app/feature/home/presentation/manager/banner_controller.dart';
import 'package:shopping_app/feature/home/presentation/manager/category_controller.dart';
import 'package:shopping_app/feature/home/presentation/manager/product_controller.dart';
import 'package:shopping_app/feature/home/presentation/view/widgets/category_list_title.dart';
import 'package:shopping_app/feature/home/presentation/view/widgets/category_list_view.dart';
import 'package:shopping_app/feature/home/presentation/view/widgets/custom_swiper_banner.dart';
import 'package:shopping_app/feature/home/presentation/view/widgets/product_grid_view.dart';
import 'package:shopping_app/feature/home/presentation/view/widgets/product_list_title.dart';
import 'package:shopping_app/feature/home/presentation/view/widgets/search_product.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewBody extends StatelessWidget {
  final BannerController bannerController = Get.find();
  final ProductController productController = Get.find();
  final CategoryController categoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Obx(() {
        // Check if there are any errors
        if (bannerController.errorMessage.isNotEmpty ||
            productController.errorMessage.isNotEmpty ||
            categoryController.errorMessage.isNotEmpty) {
          return NetworkErrorWidget(
            message: bannerController.errorMessage.isNotEmpty
                ? bannerController.errorMessage.value
                : productController.errorMessage.isNotEmpty
                    ? productController.errorMessage.value
                    : categoryController.errorMessage.value,
            onRetry: () {
              // Clear errors and retry fetching data
              bannerController.errorMessage.value = '';
              productController.errorMessage.value = '';
              categoryController.errorMessage.value = '';

              bannerController.fetchbanners();
              productController.fetchProducts();
              categoryController.fetchcategory();
            },
          );
        }

        // Main UI with Skeletonizer for loading states
        return Skeletonizer(
          enabled: bannerController.isLoading.value ||
              productController.isLoading.value ||
              categoryController.isLoading.value,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SearchProduct(),
                    verticalSpacing(height: 20),
                    Skeletonizer(
                      enabled: bannerController.isLoading.value,
                      child: CustomSwiperBanner(),
                    ),
                    verticalSpacing(height: 20),
                    Skeletonizer(
                      enabled: categoryController.isLoading.value,
                      child: const CategoryListTitle(),
                    ),
                    Skeletonizer(
                      enabled: categoryController.isLoading.value,
                      child: CategoryListView(),
                    ),
                    verticalSpacing(height: 10),
                    Skeletonizer(
                      enabled: productController.isLoading.value,
                      child: const ProductListTitle(),
                    ),
                  ],
                ),
              ),
              // Product Grid View inside Sliver
              ProductgridView(),
            ],
          ),
        );
      }),
    );
  }
}
