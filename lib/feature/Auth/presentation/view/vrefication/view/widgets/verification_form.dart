import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/core/widgets/custom_button.dart';
import 'package:shopping_app/feature/Auth/presentation/view/change_password/view/change_password_view.dart';
import 'package:shopping_app/feature/Auth/presentation/view/vrefication/view/widgets/custom_verification_field.dart';
import 'package:shopping_app/feature/Auth/presentation/view/vrefication/view/widgets/verification_count.dart';

class VerificationForm extends StatelessWidget {
  const VerificationForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomVerificationField(),
        verticalSpacing(height: 50),
        const VerificationCount(),
        verticalSpacing(height: 10),
        CustomButton(
          text: 'Verify',
          onPessend: () {
            Get.to(const ChangePasswordView());
          },
          width: double.infinity,
        ),
      ],
    );
  }
}
