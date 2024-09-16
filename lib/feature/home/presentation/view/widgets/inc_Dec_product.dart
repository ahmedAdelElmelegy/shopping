import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/style/app_color.dart';
import 'package:shopping_app/core/style/app_text_style.dart';
import 'package:shopping_app/core/utils/spacing.dart';

class IncDecProduct extends StatelessWidget {
  const IncDecProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColor.subtitlecolor),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          InkWell(onTap: () {}, child: const Icon(Icons.remove)),
          horizontalSpacing(width: 5),
          Text(
            '1',
            style: AppTextStyles.mediumHeader,
          ),
          horizontalSpacing(width: 5),
          InkWell(onTap: () {}, child: const Icon(Icons.add))
        ],
      ),
    );
  }
}
