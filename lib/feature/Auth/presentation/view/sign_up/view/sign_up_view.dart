import 'package:flutter/material.dart';
import 'package:shopping_app/feature/Auth/presentation/view/sign_up/view/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpViewBody(),
    );
  }
}
