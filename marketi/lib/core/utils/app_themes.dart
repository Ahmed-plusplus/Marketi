import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/generated/assets.dart';

var appTheme = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(AppColors.primary),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(14.0))),
      fixedSize: WidgetStatePropertyAll(Size(double.infinity, 48)),
      alignment: Alignment.center,
    )
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsetsGeometry.all(14)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(14.0),
        )),
        side: WidgetStatePropertyAll(BorderSide(color: AppColors.lightBlue700.withAlpha(180))),
      )
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(14.0),
    ),
    backgroundColor: AppColors.lightBlue900,
    extendedPadding: EdgeInsetsGeometry.all(11.11),
    iconSize: 18,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: Assets.fonts.poppins,
      color: AppColors.darkBlue900,
      overflow: TextOverflow.ellipsis,
    ),
    titleMedium: TextStyle(
      fontFamily: Assets.fonts.poppins,
      overflow: TextOverflow.ellipsis,
    ),
    titleSmall: TextStyle(
      fontFamily: Assets.fonts.poppins,
      overflow: TextOverflow.ellipsis,
    ),
    bodyLarge: TextStyle(
      fontFamily: Assets.fonts.poppins,
      overflow: TextOverflow.ellipsis,
    ),
    bodyMedium: TextStyle(
      fontFamily: Assets.fonts.poppins,
      overflow: TextOverflow.ellipsis,
    ),
    bodySmall: TextStyle(
      fontFamily: Assets.fonts.poppins,
      overflow: TextOverflow.ellipsis,
    ),
    displayLarge: TextStyle(
      fontFamily: Assets.fonts.poppins,
      overflow: TextOverflow.ellipsis,
    ),
    displayMedium: TextStyle(
      fontFamily: Assets.fonts.poppins,
      overflow: TextOverflow.ellipsis,
    ),
    displaySmall: TextStyle(
      fontFamily: Assets.fonts.poppins,
      overflow: TextOverflow.ellipsis,
    ),
    headlineLarge: TextStyle(
      fontFamily: Assets.fonts.poppins,
      overflow: TextOverflow.ellipsis,
    ),
    headlineMedium: TextStyle(
      fontFamily: Assets.fonts.poppins,
      overflow: TextOverflow.ellipsis,
    ),
    headlineSmall: TextStyle(
      fontFamily: Assets.fonts.poppins,
      overflow: TextOverflow.ellipsis,
    ),
    labelLarge: TextStyle(
      fontFamily: Assets.fonts.poppins,
      overflow: TextOverflow.ellipsis,
    ),
    labelMedium: TextStyle(
      fontFamily: Assets.fonts.poppins,
      overflow: TextOverflow.ellipsis,
    ),
    labelSmall: TextStyle(
      fontFamily: Assets.fonts.poppins,
      overflow: TextOverflow.ellipsis,
    ),
  )
);

var textElevatedButtonStyle = TextStyle(
    fontSize: 18,
    fontFamily: Assets.fonts.poppins,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    overflow: TextOverflow.ellipsis
);

var textOutlinedButtonStyle = TextStyle(
    fontSize: 14,
    fontFamily: Assets.fonts.poppins,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
    overflow: TextOverflow.ellipsis
);
