import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';
import 'package:shopping_app/feature/home/presentation/view/widgets/product_description.dart';
import 'package:shopping_app/feature/home/presentation/view/widgets/product_detailes_btn.dart';
import 'package:shopping_app/feature/home/presentation/view/widgets/product_price.dart';
import 'package:shopping_app/feature/home/presentation/view/widgets/product_titles.dart';

import 'product_detailes_image.dart';

class ProductDetailesViewBody extends StatelessWidget {
  const ProductDetailesViewBody({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductDetailesImage(
          image: productEntity.productImage,
          smImages: productEntity.productsmImage,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing(height: 15),
                ProductTitles(
                  title: productEntity.productName,
                ),
                verticalSpacing(height: 10),
                ProductPrice(
                  price: productEntity.productPrice.toString(),
                  oldPrice: productEntity.productOldPrice.toString(),
                ),
                verticalSpacing(height: 16),
                ProductDescription(
                  description: productEntity.productDescription,
                ),
                Spacer(),
                const ProductDetailesBtn(),
                verticalSpacing(height: 10),
              ],
            ),
          ),
        )
      ],
    );
  }
}
