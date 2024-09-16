import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/core/assets/image/assets.dart';
import 'package:shopping_app/feature/OnBoarding/presentation/view/onboarding_view.dart';
import 'package:shopping_app/feature/home/presentation/bindings/home_bindings.dart';
import 'package:shopping_app/feature/main_screen/presentation/view/main_screen_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      if (sharedPreferences.getString('token') == null ||
          sharedPreferences.getString('token') == '') {
        Get.offAll(const OnboardingView());
      } else {
        Get.offAll(MainScreenView(), binding: HomeBindings());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SvgPicture.asset(
      Assets.imagesLogo,
      height: 110.h,
      width: 110.w,
    ));
  }
}
