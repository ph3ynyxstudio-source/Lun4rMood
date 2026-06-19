import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppGradients {
  const AppGradients._();

  static const LinearGradient background = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.backgroundDeep,
      AppColors.background,
      AppColors.surface,
    ],
  );

  static const LinearGradient cyanPurple = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.lunaCyan,
      AppColors.lunaPurple,
    ],
  );

  static const LinearGradient purplePink = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.lunaPurple,
      AppColors.lunaPink,
    ],
  );

  static const LinearGradient cyanPink = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.lunaCyan,
      AppColors.lunaPink,
    ],
  );

  static const LinearGradient darkPurple = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.backgroundDeep,
      AppColors.surface,
      AppColors.lunaPurple,
    ],
  );
}
