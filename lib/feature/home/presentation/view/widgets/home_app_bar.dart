import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/assets/image/assets.dart';
import 'package:shopping_app/core/style/app_text_style.dart';

AppBar homeAppBar() {
  return AppBar(
    title: Text(
      'Hey👋',
      style: AppTextStyles.bodyText,
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 10.w),
        child: CircleAvatar(
          radius: 20.h,
          backgroundImage: const AssetImage(Assets.imagesProfileImage),
        ),
      ),
    ],
  );
}
