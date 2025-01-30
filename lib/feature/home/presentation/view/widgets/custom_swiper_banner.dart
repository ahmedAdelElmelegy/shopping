import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/feature/home/presentation/manager/banner_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSwiperBanner extends StatelessWidget {
  CustomSwiperBanner({
    super.key,
  });
  BannerController bannerController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Skeletonizer(
        enabled: bannerController.isLoading.value,
        child: SizedBox(
            height: 200.h,
            child: Swiper(
              autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: FancyShimmerImage(
                      imageUrl: bannerController.banners[index].bannerImage,
                      boxFit: BoxFit.fill,
                    ));
              },
              itemCount: bannerController.banners.length,
              // viewportFraction: 0.8,
              scale: 0.9,
            )),
      );
    });
  }
}
