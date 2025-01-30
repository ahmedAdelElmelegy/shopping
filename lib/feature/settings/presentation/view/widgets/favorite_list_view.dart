import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/widgets/custom_loading_indicator.dart';
import 'package:shopping_app/core/widgets/network_error_widget.dart';
import 'package:shopping_app/feature/settings/presentation/manager/fetch_favorite_controller.dart';
import 'package:shopping_app/feature/settings/presentation/view/widgets/empty_favorite.dart';
import 'package:shopping_app/feature/settings/presentation/view/widgets/favorite_item.dart';

class FavoriteListView extends StatefulWidget {
  FavoriteListView({
    super.key,
  });

  @override
  State<FavoriteListView> createState() => _FavoriteListViewState();
}

class _FavoriteListViewState extends State<FavoriteListView> {
  @override
  FetchFavoriteController favoriteController = Get.find();
  void initState() {
    favoriteController.fetchFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (favoriteController.error.isNotEmpty) {
        return NetworkErrorWidget(
          message: favoriteController.error.value,
          onRetry: () {
            favoriteController.error.value = '';
            favoriteController.fetchFavorite();
          },
        );
      } else if (favoriteController.isLoading.value) {
        return const CustomLoadingIndicator();
      } else if (favoriteController.favorite.isEmpty) {
        return const EmptyFavorite();
      }
      return ListView.builder(
        itemBuilder: (context, index) => FavoriteItem(
          favoriteEntity: favoriteController.favorite[index],
        ),
        itemCount: favoriteController.favorite.length,
      );
    });
  }
}
