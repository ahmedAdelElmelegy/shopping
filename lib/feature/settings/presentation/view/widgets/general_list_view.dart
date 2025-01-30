import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopping_app/feature/Auth/presentation/bindings/auth_bindings.dart';
import 'package:shopping_app/feature/Auth/presentation/view/change_password/view/change_password_view.dart';
import 'package:shopping_app/feature/settings/domain/entity/general_entity.dart';
import 'package:shopping_app/feature/settings/presentation/bindings/settings_bindings.dart';
import 'package:shopping_app/feature/settings/presentation/view/edit_profile_view.dart';
import 'package:shopping_app/feature/settings/presentation/view/favirorite_view.dart';
import 'package:shopping_app/feature/settings/presentation/view/widgets/General_item.dart';

class GeneralListViewItem extends StatelessWidget {
  GeneralListViewItem({super.key});
  List<GeneralEntity> generalitem = [
    GeneralEntity(icon: Icons.person, title: 'Edit Profile', () {
      Get.to(const EditProfileView());
    }),
    GeneralEntity(icon: IconlyBold.heart, title: 'Favorite', () {
      Get.to(const FaviroriteView(), binding: SettingsBindings());
    }),
    GeneralEntity(icon: Icons.badge, title: 'Orders', () {
      Get.to(const FaviroriteView(), binding: SettingsBindings());
    }),
    GeneralEntity(icon: IconlyLight.lock, title: 'Change Password', () {
      Get.to(const ChangePasswordView(), binding: AuthBindings());
    }),
    GeneralEntity(icon: IconlyLight.notification, title: 'Notification', () {}),
    GeneralEntity(icon: Icons.security, title: 'Security', () {}),
    GeneralEntity(
        icon: Icons.language, title: 'language', hinttext: 'English', () {}),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        generalitem.length,
        (index) => GestureDetector(
          onTap: generalitem[index].fun,
          child: GeneralItem(
            item: generalitem[index],
          ),
        ),
      ),
    );
  }
}
