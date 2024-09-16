import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shopping_app/core/utils/spacing.dart';

import 'package:shopping_app/feature/Auth/presentation/view/change_password/view/widgets/change_password_form.dart';
import 'package:shopping_app/feature/Auth/presentation/view/change_password/view/widgets/change_password_header.dart';
import 'package:shopping_app/feature/Auth/presentation/view/change_password/view/widgets/change_password_image.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
          children: [
            const ChangePasswordHeader(),
            verticalSpacing(height: 10),
            const ChangePasswordImage(),
             ChangePasswordForm()
          ],
        ),
      ),
    );
  }
}
