import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/error/validator.dart';
import 'package:shopping_app/core/style/app_text_style.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/core/widgets/custom_button.dart';
import 'package:shopping_app/core/widgets/custom_field.dart';
import 'package:shopping_app/core/widgets/custom_loading_indicator.dart';
import 'package:shopping_app/feature/Auth/presentation/manager/login_controller.dart';
import 'package:shopping_app/feature/Auth/presentation/view/forget_password/view/forget_password_view.dart';

class LoginFormSection extends StatelessWidget {
  LoginFormSection({
    super.key,
  });
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Obx(() {
        return Column(
          children: [
            CustomField(
              isObsecure: false,
              controller: emailController,
              validator: (value) => Validator.validateEmail(value ?? ''),
              hintText: 'Email',
              prefexicon: Icons.email,
            ),
            verticalSpacing(height: 21),
            CustomField(
              onTap: () {
                loginController.isObsecure();
              },
              isObsecure: loginController.isHint.value,
              validator: (value) => Validator.validatePassword(value ?? ''),
              controller: passwordController,
              hintText: 'Password',
              prefexicon: Icons.key,
              suffixicon: Icons.remove_red_eye,
            ),
            verticalSpacing(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  Get.to(
                    () => const ForgetPasswordView(),
                  );
                },
                child: Text(
                  'Forgot password?',
                  style: AppTextStyles.caption,
                ),
              ),
            ),
            verticalSpacing(height: 30),
            CustomButton(
              width: double.infinity,
              text: 'Login',
              child: loginController.isLoading.value
                  ? const CustomLoadingIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      'Login',
                      style: AppTextStyles.buttonText,
                    ),
              onPessend: () {
                if (formKey.currentState!.validate()) {
                  loginController.login(
                      email: emailController.text,
                      password: passwordController.text);
                }
              },
            ),
          ],
        );
      }),
    );
  }
}
