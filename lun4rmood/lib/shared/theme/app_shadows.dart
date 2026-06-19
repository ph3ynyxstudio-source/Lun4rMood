import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppShadows {
  const AppShadows._();

  static const List<BoxShadow> none = [];

  static const List<BoxShadow> sm = [
    BoxShadow(
      color: AppColors.crystalGlow,
      blurRadius: 12,
      spreadRadius: -8,
    ),
  ];

  static const List<BoxShadow> md = [
    BoxShadow(
      color: AppColors.crystalGlow,
      blurRadius: 20,
      spreadRadius: -10,
    ),
    BoxShadow(
      color: AppColors.lunarGlow,
      blurRadius: 16,
      spreadRadius: -14,
    ),
  ];

  static const List<BoxShadow> lg = [
    BoxShadow(
      color: AppColors.phoenixGlow,
      blurRadius: 32,
      spreadRadius: -14,
    ),
    BoxShadow(
      color: AppColors.lunarGlow,
      blurRadius: 24,
      spreadRadius: -18,
    ),
  ];
}
