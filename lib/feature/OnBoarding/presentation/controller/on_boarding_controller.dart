import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/feature/Auth/presentation/bindings/auth_bindings.dart';
import 'package:shopping_app/feature/Auth/presentation/view/login/view/login_view.dart';

class OnBoardingController extends GetxController {
  var currentPageIndex = 0.obs;
  void setPageIndex(int index) {
    currentPageIndex.value = index;
  }

  final PageController pageController = PageController();
  void nextPage() {
    if (currentPageIndex.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      currentPageIndex.value++;
    } else {
      Get.offAll(const LoginView(), binding: AuthBindings());
    }
  }
}
