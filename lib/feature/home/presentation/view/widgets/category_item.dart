import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/presentation/manager/fetch_category_product_controller.dart';
import 'package:shopping_app/feature/home/presentation/manager/product_controller.dart';
import 'package:shopping_app/feature/home/presentation/view/category_view.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({
    super.key,
    required this.categoryEntity,
  });
  final CategoryEntity categoryEntity;
  FetchCategoryProductController categoryProductController = Get.find();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        categoryProductController.fetchCategoryProducts(
            categoryId: categoryEntity.categoryId);
        Get.to(CategoryView(
          categoryEntity: categoryEntity,
        ));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: CircleAvatar(
          radius: 35.w,
          backgroundImage: NetworkImage(categoryEntity.categoryImage),
        ),
      ),
    );
  }
}
