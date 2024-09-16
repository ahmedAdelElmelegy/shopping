import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/style/app_text_style.dart';
import 'package:shopping_app/core/utils/spacing.dart';
import 'package:shopping_app/core/widgets/custom_button.dart';
import 'package:shopping_app/core/widgets/custom_field.dart';
import 'package:shopping_app/core/widgets/custom_loading_indicator.dart';
import 'package:shopping_app/core/widgets/network_error_widget.dart';
import 'package:shopping_app/feature/settings/domain/entity/user_entity.dart';
import 'package:shopping_app/feature/settings/presentation/manager/fetch_profie_controller.dart';
import 'package:shopping_app/feature/settings/presentation/manager/update_profile_controller.dart';
import 'package:shopping_app/feature/settings/presentation/view/widgets/profile_image.dart';

class EditProfileViewBody extends StatelessWidget {
  EditProfileViewBody({super.key});
  FetchProfieController profieController = Get.find();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  UpdateProfileController updateProfileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      nameController.text = profieController.userEntity?.name ?? '';
      emailController.text = profieController.userEntity?.email ?? '';
      phoneController.text = profieController.userEntity?.phone ?? '';
      if (updateProfileController.error.value.isNotEmpty) {
        return NetworkErrorWidget(
          message: updateProfileController.error.value,
          onRetry: () {
            updateProfileController.error.value = '';
          },
        );
      }
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              const ProfileImage(),
              verticalSpacing(height: 50),
              CustomField(
                prefexicon: IconlyBold.profile,
                isObsecure: false,
                hintText: 'Name',
                controller: nameController,
              ),
              verticalSpacing(height: 10),
              CustomField(
                prefexicon: Icons.email,
                isObsecure: false,
                hintText: 'Email',
                controller: emailController,
              ),
              verticalSpacing(height: 10),
              CustomField(
                prefexicon: IconlyBold.call,
                isObsecure: false,
                hintText: 'Phone',
                controller: phoneController,
              ),
              verticalSpacing(height: 50),
              CustomButton(
                onPessend: () {
                  UserEntity userEntity = UserEntity(
                      id: profieController.userEntity!.id,
                      email: emailController.text ??
                          profieController.userEntity!.email,
                      name: nameController.text ??
                          profieController.userEntity!.name,
                      image: profieController.userEntity!.image,
                      phone: phoneController.text ??
                          profieController.userEntity!.phone);
                  updateProfileController.updateProfile(userEntity);
                  profieController.fetchProfile();
                },
                child: updateProfileController.isLoading.value
                    ? const CustomLoadingIndicator()
                    : Text(
                        'Update',
                        style: AppTextStyles.mediumHeader
                            .copyWith(color: Colors.white),
                      ),
              )
            ],
          ),
        ),
      );
    });
  }
}
