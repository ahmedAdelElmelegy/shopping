import 'package:flutter/material.dart';
import 'package:shopping_app/core/style/app_text_style.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const HeaderWidget({
    super.key, required this.title, required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.largeHeader,
        ),
        Text(
          subtitle,
          style: AppTextStyles.caption,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
