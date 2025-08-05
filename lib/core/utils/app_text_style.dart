import 'package:desktop_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyle {
  // Sign in

  static TextStyle fontWeightw500Size16Colorblack() => TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
  static TextStyle fontWeightw400Size18ColorWhite() => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
}
