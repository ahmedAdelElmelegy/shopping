import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/style/app_text_style.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/core/widgets/custom_loading_indicator.dart';
import 'package:shopping_app/core/widgets/network_error_widget.dart';
import 'package:shopping_app/feature/settings/presentation/manager/fetch_profie_controller.dart';

class UserInfoData extends StatelessWidget {
  UserInfoData({
    super.key,
  });
  FetchProfieController profieController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profieController.error.value.isNotEmpty) {
        return NetworkErrorWidget(
          message: profieController.error.value,
          onRetry: () {
            profieController.error.value = '';
            profieController.fetchProfile();
          },
        );
      } else if (profieController.isLoading.value) {
        return const CustomLoadingIndicator();
      }

      return Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(profieController.userEntity!.image),
          ),
          horizontalSpacing(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profieController.userEntity?.name ?? '',
                style: AppTextStyles.mediumHeader,
              ),
              Text(profieController.userEntity?.email ?? ''),
            ],
          )
        ],
      );
    });
  }
}
