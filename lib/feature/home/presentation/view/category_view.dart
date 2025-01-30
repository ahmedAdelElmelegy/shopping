import 'package:flutter/material.dart';
import 'package:shopping_app/core/func/app_bar_title.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';

import 'package:shopping_app/feature/home/presentation/view/widgets/category_view_body.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key, required this.categoryEntity});
 final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTitle(categoryEntity.categoryTitle),
      body:  CategoryViewBody(),
    );
  }
}
