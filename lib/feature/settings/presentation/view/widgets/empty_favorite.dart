import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/assets/image/assets.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/core/widgets/custom_button.dart';
import 'package:shopping_app/feature/search/presentation/view/search_view.dart';

class EmptyFavorite extends StatelessWidget {
  const EmptyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.imagesBagWish,
              // height: 400.h,
            ),
            verticalSpacing(height: 100.h),
            CustomButton(
              radios: 50.r,
              width: 120.w,
              text: 'Add To WishList',
              color: Colors.blueGrey,
              onPessend: () {
                Get.to(const SearchView());
              },
            )
          ],
        ),
      ),
    );
  }
}
