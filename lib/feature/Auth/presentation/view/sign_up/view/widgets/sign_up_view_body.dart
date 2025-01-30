import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/feature/Auth/presentation/view/login/view/widgets/logo_image.dart';
import 'package:shopping_app/feature/Auth/presentation/view/login/view/widgets/or_widget.dart';
import 'package:shopping_app/feature/Auth/presentation/view/login/view/widgets/social_section.dart';
import 'package:shopping_app/feature/Auth/presentation/view/sign_up/view/widgets/sign_up_form_secton.dart';
import 'package:shopping_app/feature/Auth/presentation/view/sign_up/view/widgets/sign_up_header.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            verticalSpacing(height: 50),
            const LogoImage(),
            const SignUpHeader(),
            verticalSpacing(height: 48),
             SignUpFormSection(),
            verticalSpacing(height: 10),
            const OrWidget(),
            const SocialSection(),
          ],
        ),
      ),
    );
  }
}
