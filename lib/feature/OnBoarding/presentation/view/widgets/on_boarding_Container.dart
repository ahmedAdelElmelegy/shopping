import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/style/app_color.dart';

class OnBoardingContainer extends StatelessWidget {
  final Widget child;
  const OnBoardingContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 272.h,
      width: 343.w,
      decoration: BoxDecoration(
        color: AppColor.whitecolor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            offset: const Offset(0, 4), 
            blurRadius: 8, 
            spreadRadius: 2, 
          ),
        ],
      ),
      child: child,
    );
  }
}
