import 'package:flutter/material.dart';
import 'package:shopping_app/core/style/app_text_style.dart';
import 'package:shopping_app/feature/home/presentation/view/widgets/inc_Dec_product.dart';

class ProductTitles extends StatelessWidget {
  const ProductTitles({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.mediumHeader,
          ),
        ),
      ],
    );
  }
}
