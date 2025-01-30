import 'package:flutter/material.dart';

import 'package:shopping_app/core/func/custom_appbar.dart';
import 'package:shopping_app/feature/Auth/presentation/view/forget_password/view/widgets/forget_pass_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(),
      body: const ForgetPassViewBody(),
    );
  }
}
