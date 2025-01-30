import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/style/app_color.dart';
import 'package:shopping_app/core/style/app_text_style.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPessend;
  final String? text;
  final double? width;
  final Widget? child;
  final double? height;
  final Color? color;
  final double? radios;
  const CustomButton(
      {super.key,
      this.onPessend,
      this.text,
      this.width,
      this.child,
      this.color,
      this.height,
      this.radios});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(radios ?? 20.r)),
        minimumSize: Size(width ?? 295.w, height ?? 60.h),
        backgroundColor: color ?? AppColor.primarycolor,
      ),
      onPressed: onPessend,
      child: child == null
          ? Text(
              text!,
              style: AppTextStyles.buttonText,
            )
          : child,
    );
  }
}
