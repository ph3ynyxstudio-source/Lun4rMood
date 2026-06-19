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
        tertiary: AppColors.phoenixAccent,
        error: AppColors.softError,
        surface: AppColors.surface,
      ),
      textTheme: const TextTheme(
        displayMedium: AppTextStyles.display,
        headlineLarge: AppTextStyles.titleLarge,
        titleLarge: AppTextStyles.titleMedium,
        titleMedium: AppTextStyles.titleSmall,
        bodyMedium: AppTextStyles.body,
        bodySmall: AppTextStyles.small,
        labelSmall: AppTextStyles.caption,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.backgroundDeep,
        indicatorColor: AppColors.cardElevated,
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
      sliderTheme: const SliderThemeData(
        activeTrackColor: AppColors.lunarAccent,
        inactiveTrackColor: AppColors.border,
        thumbColor: AppColors.textPrimary,
        overlayColor: AppColors.lunarOverlay,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: const BorderSide(color: AppColors.lunarAccent),
        ),
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
            borderRadius: BorderRadius.circular(AppRadius.pill),
          ),
          textStyle: AppTextStyles.button,
        ),
      ),
    );
  }
}
