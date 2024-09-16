import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/feature/OnBoarding/presentation/controller/on_boarding_controller.dart';
import 'package:shopping_app/feature/OnBoarding/presentation/view/widgets/on_boarding_circle_nav.dart';

class OnBoardingListViewScrool extends StatelessWidget {
  OnBoardingListViewScrool({
    super.key,
  });
  final OnBoardingController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (index) => OnBordingCircleNav(
            isActive: controller.currentPageIndex == index,
          ),
        ),
      );
    });
  }
}
