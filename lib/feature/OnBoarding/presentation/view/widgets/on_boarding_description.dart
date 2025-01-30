import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/core/widgets/custom_button.dart';
import 'package:shopping_app/feature/OnBoarding/data/model/on_boarding_model.dart';
import 'package:shopping_app/feature/OnBoarding/presentation/controller/on_boarding_controller.dart';
import 'package:shopping_app/feature/OnBoarding/presentation/view/widgets/on_boarding_caption.dart';
import 'package:shopping_app/feature/OnBoarding/presentation/view/widgets/on_boarding_list_view_scrool.dart';
import 'package:shopping_app/feature/OnBoarding/presentation/view/widgets/on_boarding_title.dart';

class OnBoardingDescription extends StatelessWidget {
  OnBoardingDescription({super.key, required this.onBoardingModel});
  final OnBoardingModel onBoardingModel;
  OnBoardingController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.h),
      child: Column(
        children: [
          OnboardingTitle(
            onBoardingModel: onBoardingModel,
          ),
          verticalSpacing(height: 5),
          const OnBoardingCaption(),
          verticalSpacing(height: 5),
          OnBoardingListViewScrool(),
          verticalSpacing(height: 15),
          CustomButton(
            text: 'Next',
            onPessend: () {
              controller.nextPage();
            },
          ),
        ],
      ),
    );
  }
}
