import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/func/set_up_server_locator.dart';
import 'package:shopping_app/feature/cart/data/cart_Repo_imp/cart_repo_imp.dart';
import 'package:shopping_app/feature/cart/domain/use_case/add_to_cart_user_case.dart';
import 'package:shopping_app/feature/cart/domain/use_case/fetch_cart_use_case.dart';
import 'package:shopping_app/feature/cart/domain/use_case/remove_to_cart_use_case.dart';
import 'package:shopping_app/feature/cart/domain/use_case/update_quantity_to_cart_use_case.dart';
import 'package:shopping_app/feature/cart/presentation/manager/cart_controller.dart';
import 'package:shopping_app/feature/cart/presentation/view/cart_view.dart';
import 'package:shopping_app/feature/home/presentation/view/home_view.dart';
import 'package:shopping_app/feature/main_screen/presentation/manager/main_controller.dart';
import 'package:shopping_app/feature/search/presentation/view/search_view.dart';
import 'package:shopping_app/feature/settings/presentation/view/settings_view.dart';

class MainScreenView extends StatelessWidget {
  MainScreenView({super.key});

  final MainController controller = Get.put(MainController());
  final CartController cartController = Get.put(
    CartController(
      removeToCartUseCase:
          RemoveToCartUseCase(cartRepo: getIt.get<CartRepoImp>()),
      addToCartUserCase: AddToCartUserCase(cartRepo: getIt.get<CartRepoImp>()),
      fetchCartUseCase: FetchCartUseCase(cartRepo: getIt.get<CartRepoImp>()),
      updateQuantityToCartUseCase:
          UpdateQuantityToCartUseCase(cartRepo: getIt.get<CartRepoImp>()),
    ),
  );

  final List<Widget> pages = const [
    HomeView(),
    SearchView(),
    CartView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Get the cart item count from the CartController
      final int cartItemCount = cartController.cart.length;

      final List<NavigationDestination> item = [
        const NavigationDestination(
          icon: Icon(IconlyLight.home),
          label: 'Home',
          selectedIcon: Icon(IconlyBold.home),
        ),
        const NavigationDestination(
          icon: Icon(IconlyLight.search),
          label: 'Search',
          selectedIcon: Icon(IconlyBold.search),
        ),
        NavigationDestination(
          icon: Badge(
            // backgroundColor: Colors.blue,
            label: Text(cartItemCount.toString()), // Display cart item count
            child: const Icon(IconlyLight.bag2),
          ),
          label: 'Cart',
          selectedIcon: const Icon(IconlyBold.bag2),
        ),
        const NavigationDestination(
          icon: Icon(IconlyLight.setting),
          label: 'Settings',
          selectedIcon: Icon(IconlyBold.setting),
        ),
      ];

      return Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: item,
          onDestinationSelected: (value) => controller.onItemTap(value),
          selectedIndex: controller.currentIndex.value,
        ),
        body: pages[controller.currentIndex.value],
      );
    });
  }
}
