import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_app/core/func/app_bar_title.dart';
import 'package:shopping_app/feature/settings/presentation/view/widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTitle('EditProfile'),
      body: EditProfileViewBody(),
    );
  }
}
