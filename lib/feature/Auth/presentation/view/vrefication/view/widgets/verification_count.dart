
import 'package:flutter/material.dart';
import 'package:shopping_app/core/style/app_text_style.dart';

import '../../../../../../../core/utils/spacing.dart';

class VerificationCount extends StatelessWidget {
  const VerificationCount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '00.30',
          style: AppTextStyles.bodyText,
        ),
        horizontalSpacing(width: 5),
        Text(
          'Resend it',
          style: AppTextStyles.primarytext,
        ),
      ],
    );
  }
}

