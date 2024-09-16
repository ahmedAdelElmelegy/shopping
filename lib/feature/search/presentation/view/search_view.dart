import 'package:flutter/material.dart';
import 'package:shopping_app/core/func/app_bar_title.dart';
import 'package:shopping_app/core/style/app_text_style.dart';
import 'package:shopping_app/feature/search/presentation/view/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: AppTextStyles.mediumHeader,
        ),
        centerTitle: true,
      ),
      body: const SearchViewBody(),
    );
  }
}
