import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/feature/main_screen/presentation/view/main_screen_view.dart';
import '../assets/image/assets.dart';
import '../style/app_text_style.dart';
import '../widgets/custom_button.dart';

Future<dynamic> changePassswordSucessDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
        icon: Image.asset(
          Assets.imagesSucessChangePassword,
          height: 100.h,
        ),
        title: Column(
          children: [
            Text(
              'Password Update Successfully',
              style: AppTextStyles.largeHeader,
            ),
            verticalSpacing(height: 10),
            Text(
              'your password hos been updated successfully',
              style: AppTextStyles.caption,
            ),
            verticalSpacing(height: 10),
            CustomButton(
              text: 'Back to Home',
              onPessend: () {
                Get.to(MainScreenView());
              },
            ),
            verticalSpacing(height: 10)
          ],
        )),
  );
}
