import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/feature/OnBoarding/data/data_source/on_boarding_data.dart';
import 'package:shopping_app/feature/OnBoarding/presentation/controller/on_boarding_controller.dart';
import 'package:shopping_app/feature/OnBoarding/presentation/view/widgets/on_boarding_button_section.dart';
import 'package:shopping_app/feature/OnBoarding/presentation/view/widgets/on_boarding_image.dart';

class OnBoardingBody extends StatelessWidget {
  OnBoardingBody({super.key});
  final OnBoardingController controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (value) {
        controller.setPageIndex(value);
      },
      controller: controller.pageController,
      itemCount: OnBoardingData.onBoardingData.length,
      itemBuilder: (context, index) {
        final onBoardingModel = OnBoardingData.onBoardingData[index];
        return Stack(
          alignment: Alignment.center,
          children: [
            OnBoardingImage(onBoardingModel: onBoardingModel),
            OnBoardingButtonSection(onBoardingModel: onBoardingModel),
          ],
        );
      },
    );
  }
}
