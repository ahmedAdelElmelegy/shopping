import 'package:flutter/material.dart';
import 'package:shopping_app/feature/Auth/presentation/view/login/view/widgets/login_titles.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const HeaderWidget(
        title: 'Create new account',
        subtitle:
            'looks like you don’t have an account \n or connect with social network');
  }
}
