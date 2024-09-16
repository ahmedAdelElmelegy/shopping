import 'package:flutter/material.dart';
import 'package:shopping_app/feature/Auth/presentation/view/login/view/widgets/login_titles.dart';

class VerificationHeader extends StatelessWidget {
  const VerificationHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const HeaderWidget(
        title: 'Enter Verification',
        subtitle:
            'we have sent the code verification to your \n mobile number');
  }
}
