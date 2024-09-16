import 'package:flutter/material.dart';
import 'package:shopping_app/feature/Auth/presentation/view/login/view/widgets/login_titles.dart';

class ChangePasswordHeader extends StatelessWidget {
  const ChangePasswordHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const HeaderWidget(
        title: 'Enter New Password',
        subtitle: 'Please enter your new password');
  }
}
