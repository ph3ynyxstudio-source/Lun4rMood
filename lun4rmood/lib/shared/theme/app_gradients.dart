import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppGradients {
  const AppGradients._();

  static const LinearGradient background = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.backgroundDeep,
      Color.fromARGB(255, 5, 5, 27),
      Color.fromARGB(255, 8, 7, 29),
    ],
  );

  static const LinearGradient cyanPurple = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 5, 187, 190),
      Color.fromARGB(255, 83, 25, 183),
    ],
  );

  static const LinearGradient purplePink = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.lunaPurple, AppColors.lunaPink],
  );

  static const LinearGradient cyanPink = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.lunaCyan, AppColors.lunaPink],
  );

  static const LinearGradient darkPurple = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.backgroundDeep,
      AppColors.surface,
      Color.fromARGB(255, 83, 44, 255),
    ],
  );
}
