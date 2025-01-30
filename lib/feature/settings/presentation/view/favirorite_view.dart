import 'package:flutter/material.dart';
import 'package:shopping_app/core/func/app_bar_title.dart';
import 'package:shopping_app/feature/settings/presentation/view/widgets/favorite_view_body.dart';

class FaviroriteView extends StatelessWidget {
  const FaviroriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTitle('WishList'),
      body: const FavoriteViewBody(),
    );
  }
}
