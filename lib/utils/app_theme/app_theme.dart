import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      secondary: AppColors.white,
      scrim: AppColors.white,
      primary: AppColors.white.withOpacity(0.64),
      tertiary: AppColors.white.withOpacity(0.06),
      brightness: Brightness.dark,
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.c010A27,
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.c010A27,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.c010A27,
      titleTextStyle: AppTextStyle.seoulRobotoRegular.copyWith(
        color: AppColors.white,
        fontSize: 20.sp,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.white,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: AppTextStyle.seoulRobotoRegular.copyWith(
        color: AppColors.white,
        fontSize: 18.sp,
      ),
      bodyLarge: AppTextStyle.seoulRobotoBold.copyWith(
        color: AppColors.white,
        fontSize: 18.sp,
      ),
      bodySmall: AppTextStyle.seoulRobotoSemiBold.copyWith(
        color: AppColors.white,
        fontSize: 16.sp,
      ),
      headlineMedium: AppTextStyle.seoulPollerOneRegular.copyWith(
        fontSize: 32.sp,
        color: AppColors.white,
      ),
      headlineSmall: AppTextStyle.seoulRobotoRegular.copyWith(
        fontSize: 16.sp,
        color: AppColors.white.withOpacity(0.4),
      ),
      headlineLarge: AppTextStyle.seoulRobotoRegular.copyWith(
        color: AppColors.white,
        fontSize: 16.sp,
      ),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      secondary: AppColors.c010A27,
      primary: AppColors.c010A27.withOpacity(0.64),
      brightness: Brightness.light,
      scrim: AppColors.cF07448,
      tertiary: AppColors.c010A27.withOpacity(0.04),
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      titleTextStyle: AppTextStyle.seoulRobotoRegular.copyWith(
        color: AppColors.c010A27,
        fontSize: 20.sp,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.c010A27,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: AppTextStyle.seoulRobotoRegular.copyWith(
        color: AppColors.c010A27,
        fontSize: 18.sp,
      ),
      bodyLarge: AppTextStyle.seoulRobotoBold.copyWith(
        color: AppColors.c010A27,
        fontSize: 18.sp,
      ),
      bodySmall: AppTextStyle.seoulRobotoSemiBold.copyWith(
        color: AppColors.c010A27,
        fontSize: 16.sp,
      ),
      headlineMedium: AppTextStyle.seoulPollerOneRegular.copyWith(
        fontSize: 32.sp,
        color: AppColors.c010A27,
      ),
      headlineSmall: AppTextStyle.seoulRobotoRegular.copyWith(
        fontSize: 16.sp,
        color: AppColors.c010A27.withOpacity(0.4),
      ),
      headlineLarge: AppTextStyle.seoulRobotoRegular.copyWith(
        color: AppColors.c010A27,
        fontSize: 16.sp,
      ),
    ),
  );
}
