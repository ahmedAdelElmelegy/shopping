import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/func/change_password_sucess_dialog.dart';
import 'package:shopping_app/feature/Auth/domain/entities/change_password_entity.dart';
import 'package:shopping_app/feature/Auth/domain/use_case/change_password_use_case.dart';

class ChangePasswordController extends GetxController {
  var isLoading = false.obs;
  var error = ''.obs;
  final ChangePasswordUseCase changePasswordUseCase;

  ChangePasswordController({required this.changePasswordUseCase});
  Future<void> changePassword(
      ChangePasswordEntity passwordData, BuildContext context) async {
    isLoading(true);
    try {
      var result = await changePasswordUseCase.call(passwordData);
      result.fold(
        (failure) {
          error.value = failure.message;
        },
        (sucess) {
          changePassswordSucessDialog(context);
          print('Sucess');
        },
      );
    } finally {
      isLoading(false);
    }
  }
}
