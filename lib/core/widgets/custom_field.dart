import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/style/app_color.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    this.controller,
    this.validator,
    required this.hintText,
    this.isObsecure,
    this.onTap,
    this.prefexicon,
    this.suffixicon,
    this.onChanged,
  });
  final String? Function(String?)? validator;
  final IconData? prefexicon;
  final IconData? suffixicon;
  final TextEditingController? controller;
  final String hintText;
  final void Function(String)? onChanged;
  final bool? isObsecure;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: isObsecure ?? true,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        fillColor: AppColor.subtitlecolor.withOpacity(.15),
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColor.subtitlecolor),
        prefixIcon: Icon(
          prefexicon ?? Icons.key,
          color: AppColor.subtitlecolor,
        ),
        suffixIcon: InkWell(
          onTap: onTap,
          child: Icon(
            suffixicon,
            color: AppColor.subtitlecolor,
          ),
        ),
      ),
    );
  }
}
