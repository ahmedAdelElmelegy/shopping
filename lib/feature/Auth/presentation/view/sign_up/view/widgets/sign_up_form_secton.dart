import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:shopping_app/core/error/validator.dart';
import 'package:shopping_app/core/style/app_color.dart';

import 'package:shopping_app/core/style/app_text_style.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/core/widgets/custom_button.dart';
import 'package:shopping_app/core/widgets/custom_field.dart';

import 'package:shopping_app/feature/Auth/presentation/manager/sign_up_controller.dart';

class SignUpFormSection extends StatelessWidget {
  SignUpFormSection({
    super.key,
  });

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController confirmcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  SignUpController signUpController = Get.find();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Obx(() {
        return Column(
          children: [
            CustomField(
              prefexicon: IconlyBold.profile,
              controller: namecontroller,
              isObsecure: false,
              hintText: 'name',
              validator: (value) => Validator.validateName(value ?? ''),
            ),
            verticalSpacing(height: 5),
            CustomField(
              validator: (value) => Validator.validatePhoneNumber(value ?? ''),
              isObsecure: false,
              controller: phonecontroller,
              hintText: 'Phone',
              prefexicon: IconlyBold.call,
            ),
            verticalSpacing(height: 5),
            CustomField(
              validator: (value) => Validator.validateEmail(value ?? ''),
              isObsecure: false,
              controller: emailcontroller,
              hintText: 'Email',
              prefexicon: Icons.email,
            ),
            verticalSpacing(height: 5),
            CustomField(
              isObsecure: signUpController.isHint.value,
              onTap: () {
                signUpController.isObsecure();
              },
              suffixicon: Icons.remove_red_eye,
              controller: passwordcontroller,
              hintText: 'Password',
              validator: (value) => Validator.validatePassword(value ?? ''),
            ),
            verticalSpacing(height: 5),
            CustomField(
              suffixicon: Icons.remove_red_eye,
              onTap: () {
                signUpController.isObsecure();
              },
              controller: confirmcontroller,
              hintText: 'Confirm Password',
              validator: (value) => Validator.validateConfirmPassword(
                  passwordcontroller.text, confirmcontroller.text),
            ),
            verticalSpacing(height: 15),
            CustomButton(
                width: double.infinity,
                child: signUpController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Text(
                        'Sign Up',
                        style: AppTextStyles.buttonText,
                      ),
                onPessend: () {
                  if (formKey.currentState!.validate()) {
                    signUpController.signUp(
                        context: context,
                        email: emailcontroller.text,
                        password: passwordcontroller.text,
                        name: namecontroller.text,
                        phone: phonecontroller.text);
                  }
                }),
          ],
        );
      }),
    );
  }
}
