import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static const TextStyle titleLarge = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 30,
    fontWeight: FontWeight.w800,
    letterSpacing: 0,
    height: 1.15,
  );

  static const TextStyle titleMedium = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.25,
  );

  static const TextStyle body = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.45,
  );

  static const TextStyle bodyMuted = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.45,
  );

  static const TextStyle caption = TextStyle(
    color: AppColors.textMuted,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.35,
  );

  static const TextStyle button = TextStyle(
    color: AppColors.buttonText,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
  );
}
