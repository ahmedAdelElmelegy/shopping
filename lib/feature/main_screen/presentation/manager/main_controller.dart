import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var currentIndex = 0.obs;

  void onItemTap(int index) {
    currentIndex.value = index;
  }

  List<NavigationDestination> item = [
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
    const NavigationDestination(
      icon: Icon(IconlyLight.bag2),
      label: 'Cart',
      selectedIcon: Icon(IconlyBold.bag2),
    ),
    const NavigationDestination(
      icon: Icon(IconlyLight.setting),
      label: 'Settings',
      selectedIcon: Icon(IconlyBold.setting),
    ),
  ];
}
