import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/assets/image/assets.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/feature/Auth/presentation/view/forget_password/view/widgets/forget_password_form.dart';
import 'package:shopping_app/feature/Auth/presentation/view/forget_password/view/widgets/forget_password_header.dart';
import 'package:shopping_app/feature/Auth/presentation/view/forget_password/view/widgets/forget_password_image.dart';

class ForgetPassViewBody extends StatelessWidget {
  const ForgetPassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
          children: [
            const ForgetPasswordHeader(),
            const ForgetImage(),
            verticalSpacing(height: 30),
            const ForgetPasswordForm()
          ],
        ),
      ),
    );
  }
}
