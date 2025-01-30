import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/core/widgets/custom_button.dart';
import 'package:shopping_app/core/widgets/custom_field.dart';
import 'package:shopping_app/feature/Auth/presentation/view/vrefication/view/verification_view.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomField(
          hintText: '(209)555-0104',
          prefexicon: Icons.email,
        ),
        verticalSpacing(height: 20),
        verticalSpacing(height: 30),
        CustomButton(
          text: 'Continue',
          onPessend: () {
            Get.to(const VerificationView());
          },
          width: double.infinity,
        ),
      ],
    );
  }
}
