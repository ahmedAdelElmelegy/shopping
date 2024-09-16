import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/func/set_up_server_locator.dart';
import 'package:shopping_app/feature/Splash/view/splash_view.dart';

void main() async {
  runApp(const ShoppingApp());
  setUpServerLocator();
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return const GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashView(),
          );
        });
  }
}
