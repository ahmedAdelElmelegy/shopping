import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/assets/image/assets.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/feature/Auth/presentation/view/login/view/widgets/social_btn.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 15.h),
      child: Column(
        children: [
          const SocialBtn(
            text: 'Login with Google',
            socialIcon: Assets.imagesDeviconGoogle,
          ),
          verticalSpacing(height: 10),
          const SocialBtn(
            text: 'Login with Facebook',
            socialIcon: Assets.imagesLogosFacebook,
          ),
        ],
      ),
    );
  }
}
