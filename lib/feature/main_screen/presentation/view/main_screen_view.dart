import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/feature/cart/presentation/view/cart_view.dart';
import 'package:shopping_app/feature/home/presentation/view/home_view.dart';
import 'package:shopping_app/feature/main_screen/presentation/manager/main_controller.dart';
import 'package:shopping_app/feature/search/presentation/view/search_view.dart';
import 'package:shopping_app/feature/settings/presentation/view/settings_view.dart';

class MainScreenView extends StatelessWidget {
  MainScreenView({super.key});
  MainController controller = Get.put(MainController());

  List<Widget> pages = const [
    HomeView(),
    SearchView(),
    CartView(),
    SettingsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: controller.item,
          onDestinationSelected: (value) => controller.onItemTap(value),
          selectedIndex: controller.currentIndex.value,
        ),
        body: pages[controller.currentIndex.value],
      );
    });
  }
}
