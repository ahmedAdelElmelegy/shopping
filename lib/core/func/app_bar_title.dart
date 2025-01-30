import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/style/app_text_style.dart';

AppBar appBarTitle(String title) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(Icons.arrow_back_ios),
    ),
    title: Text(
      title,
      style: AppTextStyles.mediumHeader,
    ),
    centerTitle: true,
  );
}
