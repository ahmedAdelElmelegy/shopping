import 'package:flutter/material.dart';
import 'package:shopping_app/core/style/app_text_style.dart';
import 'package:shopping_app/core/utils/spacing.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.price,
    required this.oldPrice,
  });
  final String price, oldPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$${price}',
          style: AppTextStyles.largeHeaderprimary,
        ),
        horizontalSpacing(width: 20),
        Text(
          '\$${oldPrice}',
          style: AppTextStyles.mediumHeader
              .copyWith(decoration: TextDecoration.lineThrough),
        ),
      ],
    );
  }
}
