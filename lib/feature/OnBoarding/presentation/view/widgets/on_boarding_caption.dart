import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/style/app_text_style.dart';

class OnBoardingCaption extends StatelessWidget {
  const OnBoardingCaption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Text(
        'Get exclusive limited apparel that onlyyou have! Made by famous brands.',
        style: AppTextStyles.caption,
        textAlign: TextAlign.center,
      ),
    );
  }
}

