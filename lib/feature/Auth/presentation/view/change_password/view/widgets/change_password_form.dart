import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/error/validator.dart';

import 'package:shopping_app/core/func/change_password_sucess_dialog.dart';
import 'package:shopping_app/core/style/app_text_style.dart';

import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/core/widgets/custom_button.dart';
import 'package:shopping_app/core/widgets/custom_field.dart';
import 'package:shopping_app/core/widgets/custom_loading_indicator.dart';
import 'package:shopping_app/feature/Auth/domain/entities/change_password_entity.dart';
import 'package:shopping_app/feature/Auth/presentation/manager/change_password_controller.dart';

class ChangePasswordForm extends StatelessWidget {
  ChangePasswordForm({
    super.key,
  });
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController reEnterPasswordController = TextEditingController();
  ChangePasswordController changePasswordController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Form(
        key: formKey,
        child: Column(
          children: [
            CustomField(
              controller: oldPasswordController,
              validator: (value) => Validator.validatePassword(value ?? ''),
              hintText: 'Old Password',
              prefexicon: Icons.key,
              suffixicon: Icons.remove_red_eye,
            ),
            verticalSpacing(height: 5),
            CustomField(
              controller: newPasswordController,
              validator: (value) => Validator.validatePassword(value ?? ''),
              hintText: 'New Password',
              prefexicon: Icons.key,
              suffixicon: Icons.remove_red_eye,
            ),
            verticalSpacing(height: 5),
            verticalSpacing(height: 5),
            CustomField(
              controller: reEnterPasswordController,
              validator: (value) => Validator.validateConfirmPassword(
                  newPasswordController.text, value ?? ''),
              hintText: 'Re-Enter Password',
              prefexicon: Icons.key,
              suffixicon: Icons.remove_red_eye,
            ),
            verticalSpacing(height: 20),
            CustomButton(
              width: double.infinity,
              child: changePasswordController.isLoading.value
                  ? const CustomLoadingIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      'Verify',
                      style: AppTextStyles.buttonText,
                    ),
              onPessend: () {
                if (formKey.currentState!.validate()) {
                  ChangePasswordEntity changePasswordEntity =
                      ChangePasswordEntity(
                          oldPassword: oldPasswordController.text,
                          newPassword: newPasswordController.text);
                  changePasswordController.changePassword(
                      changePasswordEntity, context);
                }
              },
            ),
          ],
        ),
      );
    });
  }
}
