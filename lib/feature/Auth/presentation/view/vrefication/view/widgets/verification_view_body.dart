import 'package:flutter/material.dart';
import 'package:shopping_app/core/assets/image/assets.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/feature/Auth/presentation/view/vrefication/view/widgets/verification_form.dart';
import 'package:shopping_app/feature/Auth/presentation/view/vrefication/view/widgets/verification_header.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const VerificationHeader(),
            verticalSpacing(height: 20),
            Image.asset(Assets.imagesVerification),
            verticalSpacing(height: 30),
            const VerificationForm()
          ],
        ),
      ),
    );
  }
}
