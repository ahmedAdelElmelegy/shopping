import 'package:flutter/material.dart';
import 'package:shopping_app/core/style/app_text_style.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/feature/OnBoarding/data/model/on_boarding_model.dart';

class OnboardingTitle extends StatelessWidget {
  const OnboardingTitle({
    super.key,
    required this.onBoardingModel,
  });
  final OnBoardingModel onBoardingModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          onBoardingModel.title,
          style: AppTextStyles.largeHeader,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              onBoardingModel.subtitle,
              style: AppTextStyles.largeHeader,
            ),
            horizontalSpacing(width: 5),
            Text(
              onBoardingModel.titleprimary,
              style: AppTextStyles.largeHeaderprimary,
            ),
          ],
        ),
      ],
    );
  }
}
