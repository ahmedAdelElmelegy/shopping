import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/style/app_text_style.dart';
import 'package:shopping_app/feature/settings/domain/entity/general_entity.dart';

class GeneralItem extends StatelessWidget {
  const GeneralItem({super.key, required this.item});
  final GeneralEntity item;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.2),
                blurRadius: 10,
                spreadRadius: 2),
          ]),
      child: ListTile(
          leading: Icon(item.icon),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.title,
                style: AppTextStyles.smallHeader,
              ),
              Text(
                item.hinttext ?? '',
                style: AppTextStyles.caption,
              ),
            ],
          ),
          trailing:const Icon(Icons.keyboard_arrow_right)),
    );
  }
}
