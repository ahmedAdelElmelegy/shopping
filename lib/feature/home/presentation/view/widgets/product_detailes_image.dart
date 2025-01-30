import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/style/app_color.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/feature/home/presentation/manager/product_controller.dart';

class ProductDetailesImage extends StatelessWidget {
  ProductDetailesImage({
    super.key,
    required this.image,
    required this.smImages,
  });
  final String image;
  final List<dynamic> smImages;
  ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    productController.currentImage.value = image;

    return Obx(() {
      return Container(
        width: double.infinity,
        height: 300.h,
        decoration: BoxDecoration(
          color: AppColor.primarycolor.withOpacity(.4),
        ),
        child: Column(
          children: [
            verticalSpacing(height: 10),
            FancyShimmerImage(
              imageUrl: productController.currentImage.value,
              width: 200.h,
              height: 170.w,
            ),
            verticalSpacing(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  smImages.length,
                  (index) => InkWell(
                    onTap: () {
                      productController.changeImage(smImages[index]);
                    },
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.w),
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.primarycolor),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: FancyShimmerImage(
                          imageUrl: smImages[index],
                          width: 50,
                          height: 50,
                        )),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
