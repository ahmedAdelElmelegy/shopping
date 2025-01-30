import 'package:flutter/material.dart';

import 'package:shopping_app/core/func/custom_appbar.dart';
import 'package:shopping_app/feature/Auth/presentation/view/vrefication/view/widgets/verification_view_body.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(),
      body: const VerificationViewBody(),
    );
  }
}
