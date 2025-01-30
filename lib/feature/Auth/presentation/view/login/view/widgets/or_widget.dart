import 'package:flutter/material.dart';
import 'package:shopping_app/core/style/app_text_style.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/feature/Auth/presentation/view/login/view/widgets/custom_divider.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomDivider(),
        horizontalSpacing(width: 20),
        Text(
          'or login with',
          style: AppTextStyles.smallHeader,
        ),
        horizontalSpacing(width: 20),
        const CustomDivider()
      ],
    );
  }
}
