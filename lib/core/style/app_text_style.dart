import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/style/app_color.dart';

abstract class AppTextStyles {
  // Large header style (e.g., for titles)
  static TextStyle largeHeader = TextStyle(
    fontSize: 24.sp, // Responsive font size
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins',
    color: Colors.black,
  );
  static TextStyle largeHeaderprimary = TextStyle(
    fontSize: 24.sp, // Responsive font size
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins',
    color: Color(0xff648286),
  );

  // Medium header style (e.g., for section titles)
  static TextStyle mediumHeader = TextStyle(
    fontSize: 20.sp, // Responsive font size
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
    color: Colors.black87,
  );
  static TextStyle mediumHeaderprimary = TextStyle(
    fontSize: 20.sp, // Responsive font size
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
    color: AppColor.primarycolor,
  );
  // Small header style (e.g., for subtitles)
  static TextStyle smallHeader = TextStyle(
    fontSize: 18.sp, // Responsive font size
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    color: Colors.black54,
  );

  // Body text style
  static TextStyle bodyText = TextStyle(
    fontSize: 16.sp, // Responsive font size
    fontWeight: FontWeight.normal,
    fontFamily: 'Poppins',
    color: Colors.black87,
  );
  static TextStyle primarytext = TextStyle(
    fontSize: 18.sp, // Responsive font size
    fontWeight: FontWeight.w900,
    fontFamily: 'Poppins',
    color: AppColor.primarycolor,
  );
  // Caption text style
  static TextStyle caption = TextStyle(
    fontSize: 14.sp, // Responsive font size
    fontWeight: FontWeight.normal,
    fontFamily: 'Poppins',
    color: Colors.grey,
  );

  // Button text style
  static TextStyle buttonTextblack = TextStyle(
    fontSize: 16.sp, // Responsive font size
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
    color: Colors.black,
  );
  static TextStyle buttonText = TextStyle(
    fontSize: 16.sp, // Responsive font size
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
    color: Colors.white,
  );
}
