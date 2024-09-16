import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/style/app_color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      height: 1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColor.circleColor),
    );
  }
}
