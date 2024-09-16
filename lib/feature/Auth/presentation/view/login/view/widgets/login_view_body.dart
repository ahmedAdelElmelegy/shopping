import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/feature/Auth/presentation/view/login/view/widgets/login_form.dart';
import 'package:shopping_app/feature/Auth/presentation/view/login/view/widgets/login_header.dart';
import 'package:shopping_app/feature/Auth/presentation/view/login/view/widgets/logo_image.dart';
import 'package:shopping_app/feature/Auth/presentation/view/login/view/widgets/nav_to_screen.dart';
import 'package:shopping_app/feature/Auth/presentation/view/login/view/widgets/or_widget.dart';
import 'package:shopping_app/feature/Auth/presentation/view/login/view/widgets/social_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            verticalSpacing(height: 63),
            const LogoImage(),
            verticalSpacing(height: 20),
            const LoginHeader(),
            verticalSpacing(height: 50),
             LoginFormSection(),
            verticalSpacing(height: 17),
            const OrWidget(),
            verticalSpacing(height: 10),
            const SocialSection(),
            const NavToScreen()
          ],
        ),
      ),
    );
  }
  
}
