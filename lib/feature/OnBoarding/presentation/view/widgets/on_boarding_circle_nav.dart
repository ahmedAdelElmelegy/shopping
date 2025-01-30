import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/style/app_color.dart';

class OnBordingCircleNav extends StatelessWidget {
  const OnBordingCircleNav({super.key, this.isActive = false});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5.h),
      height: 10.h,
      width: isActive ? 25.w : 10.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          shape: BoxShape.rectangle,
          color: isActive ? AppColor.primarycolor : AppColor.circleColor),
    );
  }
}
