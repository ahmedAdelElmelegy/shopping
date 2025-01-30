import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:shopping_app/core/style/app_color.dart';
import 'package:shopping_app/core/style/app_text_style.dart';
import 'package:shopping_app/core/utils/spacing.dart';

Future<dynamic> customShowDialog(
    BuildContext context, final IconData icon, final String title) async {
  // Show the dialog
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(20),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColor.primarycolor, Colors.lightBlueAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 35,
                child: Icon(
                  icon,
                  color: AppColor.primarycolor,
                  size: 40,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: AppTextStyles.mediumHeaderprimary.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpacing(height: 16.h)
        ],
      ),
    ),
  );

  // Close the dialog after 2 seconds
  await Future.delayed(const Duration(seconds: 2));
  Get.back();
}
