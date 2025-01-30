import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/feature/settings/presentation/view/widgets/general_section.dart';
import 'package:shopping_app/feature/settings/presentation/view/widgets/logout_btn.dart';
import 'package:shopping_app/feature/settings/presentation/view/widgets/user_info_data.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserInfoData(),
            verticalSpacing(height: 20),
            const GeneralSection(),
            verticalSpacing(height: 30),
            const LogoutBtn()
          ],
        ),
      ),
    );
  }
}
