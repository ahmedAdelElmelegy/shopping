import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/feature/home/presentation/manager/category_controller.dart';
import 'package:shopping_app/feature/home/presentation/view/widgets/category_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({super.key});
  CategoryController categoryController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Skeletonizer(
        enabled: categoryController.isLoading.value,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              categoryController.category.length,
              (index) => CategoryItem(
                categoryEntity: categoryController.category[index],
              ),
            ),
          ),
        ),
      );
    });
  }
}
