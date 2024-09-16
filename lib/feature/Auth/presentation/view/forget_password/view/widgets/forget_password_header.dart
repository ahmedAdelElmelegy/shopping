import 'package:flutter/material.dart';
import 'package:shopping_app/feature/Auth/presentation/view/login/view/widgets/login_titles.dart';

class ForgetPasswordHeader extends StatelessWidget {
  const ForgetPasswordHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  const HeaderWidget(
        title: 'Forgot password',
        subtitle:
            'select which contact details should we use to\n reset your password');
  }
}
