import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_radius.dart';
import 'app_text_styles.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.lunarAccent,
        brightness: Brightness.dark,
        primary: AppColors.lunarAccent,
        secondary: AppColors.crystalAccent,
        error: AppColors.softError,
        surface: AppColors.surface,
      ),
      textTheme: const TextTheme(
        headlineLarge: AppTextStyles.titleLarge,
        titleLarge: AppTextStyles.titleMedium,
        bodyMedium: AppTextStyles.body,
        bodySmall: AppTextStyles.caption,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.surface,
        indicatorColor: AppColors.card,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final color = states.contains(WidgetState.selected)
              ? AppColors.textPrimary
              : AppColors.textMuted;
          return AppTextStyles.caption.copyWith(color: color, fontSize: 12);
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final color = states.contains(WidgetState.selected)
              ? AppColors.lunarAccent
              : AppColors.textMuted;
          return IconThemeData(color: color, size: 22);
        }),
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: AppColors.card,
        contentTextStyle: TextStyle(color: AppColors.textPrimary),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.lunarAccent,
          foregroundColor: AppColors.buttonText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          textStyle: AppTextStyles.button,
        ),
      ),
    );
  }
}
