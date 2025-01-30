import 'package:flutter/material.dart';
import 'package:shopping_app/core/widgets/custom_list_title.dart';

class ProductListTitle extends StatelessWidget {
  const ProductListTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomListTitle(title: 'Popular Products');
  }
}
