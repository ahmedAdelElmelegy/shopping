import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/style/app_text_style.dart';
import 'package:shopping_app/feature/Auth/presentation/view/sign_up/view/sign_up_view.dart';

class NavToScreen extends StatelessWidget {
  const NavToScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('First time here?'),
        TextButton(
          onPressed: () {
            Get.to(() => const SignUpView());
          },
          child: Text(
            'Sign Up',
            style: AppTextStyles.primarytext,
          ),
        ),
      ],
    );
  }
}
