import 'package:flutter/material.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/feature/Auth/presentation/view/vrefication/view/widgets/field_verification.dart';

class CustomVerificationField extends StatelessWidget {
  const CustomVerificationField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: FieldVerification()),
        horizontalSpacing(width: 20),
        const Expanded(child: FieldVerification()),
        horizontalSpacing(width: 20),
        const Expanded(child: FieldVerification()),
        horizontalSpacing(width: 20),
        const Expanded(child: FieldVerification()),
      ],
    );
  }
}
