import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/func/show_warning_dialog.dart';
import 'package:shopping_app/core/style/app_text_style.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/core/widgets/custom_button.dart';

class LogoutBtn extends StatelessWidget {
  const LogoutBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 150.w,
        child: CustomButton(
          color: Colors.red,
          width: 50.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                IconlyBold.logout,
                color: Colors.white,
              ),
              horizontalSpacing(width: 10),
              Text(
                'LogOut',
                style: AppTextStyles.mediumHeader.copyWith(color: Colors.white),
              )
            ],
          ),
          onPessend: () async {
            showWarningDialog(context);
          },
        ),
      ),
    );
  }
}
