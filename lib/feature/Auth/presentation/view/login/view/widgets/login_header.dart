import 'package:flutter/material.dart';
import 'package:shopping_app/feature/Auth/presentation/view/login/view/widgets/login_titles.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const HeaderWidget(
        title: 'Welcome',
        subtitle: 'login to your account using \n email or social network');
  }
}
