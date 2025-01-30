import 'package:fenix_case_movie_app/utility/theme/app_color.dart';
import 'package:fenix_case_movie_app/utility/theme/app_text_style.dart';
import 'package:flutter/material.dart';

//Core ThemeData
ThemeData appThemeData() => ThemeData(
    useMaterial3: true,
    appBarTheme: appBarTheme(),
    primaryColor: AppColor.primaryColor,
    listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.zero,
        dense: true,
        minVerticalPadding: 2,
        horizontalTitleGap: 0),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Colors.blue),
    scaffoldBackgroundColor: AppColor.primaryColor,
    indicatorColor: Colors.blue,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    elevatedButtonTheme: buttonThemeData(),
    cardTheme: cardTheme(),
    inputDecorationTheme: inputDecorationTheme());

SwitchThemeData switchTheme() {
  return SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.blue;
        }
        return Colors.grey;
      },
    ),
    trackColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.blue.withOpacity(0.5);
        }
        return Colors.grey.withOpacity(0.5);
      },
    ),
  );
}

ElevatedButtonThemeData buttonThemeData() {
  return ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor:
              const WidgetStatePropertyAll(AppColor.bottomNavigationBarColor),
          textStyle: WidgetStatePropertyAll(AppTextStyle.buttonLabelActive),
          overlayColor: const WidgetStatePropertyAll(Colors.white24),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)))));
}

AppBarTheme appBarTheme() => const AppBarTheme(
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Color.fromRGBO(34, 34, 34, 1)),
    backgroundColor: AppColor.appbarColor);

CardTheme cardTheme() => CardTheme(
    color: AppColor.secondaryColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: AppColor.primaryColor, width: 1)));

InputDecorationTheme inputDecorationTheme() => InputDecorationTheme(
      labelStyle: const TextStyle(
        color: Color.fromRGBO(54, 49, 61, 1),
      ),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      fillColor: Colors.white,
      filled: true,
      suffixIconColor: const Color.fromRGBO(172, 181, 187, 1),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.accentColor, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.accentColor, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColor.accentColor.withOpacity(0.5), width: 0.5),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      errorStyle:
          AppTextStyle.body.copyWith(color: Colors.red[400], fontSize: 14),
      border: const OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      hintStyle: AppTextStyle.hintStyle,
    );
