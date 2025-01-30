import 'package:flutter/material.dart';
import 'package:shopping_app/core/func/custom_appbar.dart';
import 'package:shopping_app/feature/Auth/presentation/view/change_password/view/widgets/change_password_view_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: customAppbar(),
      ),
      body: const ChangePasswordViewBody(),
    );
  }
}
