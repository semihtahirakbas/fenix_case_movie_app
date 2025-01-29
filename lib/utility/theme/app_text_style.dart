import 'package:fenix_case_movie_app/utility/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static const baseTextStyle = TextStyle();

  static final appTitle = baseTextStyle.copyWith(
      fontSize: 16, color: AppColor.appTextColor, fontWeight: FontWeight.w600);

  static final body = baseTextStyle.copyWith(
    fontSize: 14,
    color: AppColor.appTextColor,
    fontWeight: FontWeight.w400,
  );

  static final caption = baseTextStyle.copyWith(
    fontSize: 14,
    color: AppColor.appTextColor,
    fontWeight: FontWeight.w600,
  );

  static final hintStyle = baseTextStyle.copyWith(
      fontSize: 14,
      color: const Color.fromRGBO(197, 197, 197, 1),
      fontWeight: FontWeight.w500);

  static final buttonLabelActive = baseTextStyle.copyWith(
      fontSize: 14,
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontWeight: FontWeight.bold);

  static final buttonLabelInactive = baseTextStyle.copyWith(
      fontSize: 16,
      color: const Color.fromRGBO(34, 34, 34, 0.5),
      fontWeight: FontWeight.w500);
}
