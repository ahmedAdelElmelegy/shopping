import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/widgets/custom_field.dart';
import 'package:shopping_app/feature/home/presentation/manager/product_controller.dart';

class SearchProduct extends StatelessWidget {
  SearchProduct({super.key});
  ProductController productController = Get.find();
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (productController) {
      return CustomField(
        isObsecure: false,
        onChanged: (value) {
          productController.searchProduct(value);
        },
        hintText: 'Search',
        prefexicon: IconlyBold.search,
        suffixicon: Icons.clear,
        controller: searchController,
      );
    });
  }
}
