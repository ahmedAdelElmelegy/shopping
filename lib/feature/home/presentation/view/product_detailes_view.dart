import 'package:flutter/material.dart';
import 'package:shopping_app/core/func/app_bar_title.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';
import 'package:shopping_app/feature/home/presentation/view/widgets/product_detailes_view_body.dart';

class ProductDetailesView extends StatelessWidget {
  const ProductDetailesView({super.key, required this.productEntity});
 final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTitle('Product Details'),
      body: ProductDetailesViewBody(
        productEntity: productEntity,
      ),
    );
  }
}
