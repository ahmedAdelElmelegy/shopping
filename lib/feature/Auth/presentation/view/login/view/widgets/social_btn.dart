import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_app/core/style/app_color.dart';
import 'package:shopping_app/core/style/app_text_style.dart';

class SocialBtn extends StatelessWidget {
  final String text;
  final String socialIcon;
  final void Function()? onPressed;
  const SocialBtn(
      {super.key,
      required this.text,
      required this.socialIcon,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 55.h),
            backgroundColor: AppColor.subtitlecolor.withOpacity(0.01),
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(
                20.r,
              ),
            )),
        onPressed: onPressed,
        icon: SvgPicture.asset(socialIcon),
        label: Text(
          text,
          style: AppTextStyles.buttonTextblack,
        ));
  }
}
