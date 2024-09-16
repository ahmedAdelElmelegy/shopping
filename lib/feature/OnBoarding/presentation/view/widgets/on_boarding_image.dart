import 'package:flutter/material.dart';
import 'package:shopping_app/feature/OnBoarding/data/model/on_boarding_model.dart';

class OnBoardingImage extends StatelessWidget {
  const OnBoardingImage({
    super.key, required this.onBoardingModel,
  });
  final OnBoardingModel onBoardingModel;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      fit: BoxFit.fill,
     onBoardingModel.image,
      height: double.infinity,
      width: double.infinity,
    );
  }
}
