import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/feature/home/presentation/view/widgets/search_product.dart';
import 'package:shopping_app/feature/search/presentation/view/widgets/search_product_grid_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
           SearchProduct(),
          verticalSpacing(height: 20),
           Expanded(child: SearchProductGridView()),
        ],
      ),
    );
  }
}
