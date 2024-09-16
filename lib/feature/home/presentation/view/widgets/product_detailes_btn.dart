import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/style/app_color.dart';
import 'package:shopping_app/core/style/app_text_style.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/core/widgets/custom_button.dart';

class ProductDetailesBtn extends StatelessWidget {
  const ProductDetailesBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(50.r),
          child: Material(
            borderRadius: BorderRadius.circular(50),
            color: AppColor.subtitlecolor.withOpacity(.3),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                IconlyLight.heart,
                size: 30.w,
              ),
            ),
          ),
        ),
        horizontalSpacing(width: 20),
        CustomButton(
          width: 250,
          onPessend: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              horizontalSpacing(width: 10),
              Text(
                'Add To Cart',
                style: AppTextStyles.buttonText,
              )
            ],
          ),
        ),
      ],
    );
  }
}
