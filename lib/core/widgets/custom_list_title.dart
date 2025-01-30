import 'package:flutter/material.dart';
import 'package:shopping_app/core/style/app_text_style.dart';

class CustomListTitle extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const CustomListTitle({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: AppTextStyles.mediumHeader,
      ),
      trailing: Text(
        'View All',
        style: AppTextStyles.caption,
      ),
    );
  }
}
