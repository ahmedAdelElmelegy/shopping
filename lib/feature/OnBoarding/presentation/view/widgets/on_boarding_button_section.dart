
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/feature/OnBoarding/data/model/on_boarding_model.dart';
import 'package:shopping_app/feature/OnBoarding/presentation/view/widgets/on_boarding_Container.dart';
import 'package:shopping_app/feature/OnBoarding/presentation/view/widgets/on_boarding_description.dart';

class OnBoardingButtonSection extends StatelessWidget {
  const OnBoardingButtonSection({
    super.key, required this.onBoardingModel,
  });
final OnBoardingModel onBoardingModel;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 48.h,
      child:  OnBoardingContainer(
        child: OnBoardingDescription(onBoardingModel: onBoardingModel,),
      ),
    );
  }
}