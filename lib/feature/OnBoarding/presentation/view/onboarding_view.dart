import 'package:flutter/material.dart';
import 'package:shopping_app/feature/OnBoarding/presentation/view/widgets/on_boarding_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingBody(),
    );
  }
}
