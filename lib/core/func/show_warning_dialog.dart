import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/core/style/app_text_style.dart';
import 'package:shopping_app/feature/Auth/presentation/view/login/view/login_view.dart';
import 'package:shopping_app/feature/OnBoarding/presentation/view/onboarding_view.dart';

void showWarningDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.warning, color: Colors.orange),
            SizedBox(width: 8),
            Text('Warning'),
          ],
        ),
        content: const Text('Are you sure you want to Logout?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              SharedPreferences shared = await SharedPreferences.getInstance();
              shared.remove('token');
              Get.to(const LoginView());
            },
            child: Text(
              'Proceed',
              style: AppTextStyles.buttonText,
            ),
          ),
        ],
      );
    },
  );
}
