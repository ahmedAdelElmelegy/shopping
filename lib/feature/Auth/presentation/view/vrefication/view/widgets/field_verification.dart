import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app/core/style/app_color.dart';

class FieldVerification extends StatelessWidget {
  const FieldVerification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: AppColor.subtitlecolor.withOpacity(.15),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
      style: const TextStyle(
        fontSize: 24.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
      textAlign: TextAlign.center,
      maxLength: 1,
    );
  }
}
