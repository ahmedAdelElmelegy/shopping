import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox verticalSpacing({required double height}) {
  return SizedBox(
    height: height.h,
  );
}

SizedBox horizontalSpacing({required double width}) {
  return SizedBox(
    width: width.w,
  );
}
