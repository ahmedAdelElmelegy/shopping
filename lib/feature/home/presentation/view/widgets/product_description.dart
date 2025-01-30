import 'package:flutter/material.dart';
import 'package:shopping_app/core/style/app_text_style.dart';
import 'package:shopping_app/core/utils/spacing.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.description,
  });
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: AppTextStyles.mediumHeader,
        ),
        verticalSpacing(height: 16),
        Text(
          description,
          style: AppTextStyles.caption,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
