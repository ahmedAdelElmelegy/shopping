import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/func/sucess_register_dialog.dart';
import 'package:shopping_app/feature/Auth/domain/entities/sign_up_entity.dart';
import 'package:shopping_app/feature/Auth/domain/use_case/sign_up_use_case.dart';

class SignUpController extends GetxController {
  var isLoading = false.obs;
  final SignUpUseCase signUpUseCase;

  SignUpController({required this.signUpUseCase});
  Future<void> signUp(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required BuildContext context}) async {
    try {
      isLoading(true);

      SignUpEntity signUpEntity = SignUpEntity(
          username: name, email: email, password: password, phone: phone);
      var result = await signUpUseCase.call(signUpEntity);
      result.fold(
        (failure) => Get.snackbar("Error", failure.message),
        (userData) {
          customShowDialog(context,Icons.check, 'Email SignUp Successful');
        },
      );
    } catch (e) {
      Get.snackbar('Error', '$e');
    } finally {
      isLoading(false);
    }
  }

  var isHint = true.obs;
  void isObsecure() {
    isHint.value = !isHint.value;
  }
}
