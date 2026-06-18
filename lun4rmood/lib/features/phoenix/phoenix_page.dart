import 'package:flutter/material.dart';

import '../../shared/theme/app_colors.dart';
import '../../shared/theme/app_radius.dart';
import '../../shared/theme/app_spacing.dart';
import '../../shared/theme/app_text_styles.dart';
import '../../shared/widgets/app_card.dart';
import '../../shared/widgets/app_page.dart';

class PhoenixPage extends StatelessWidget {
  const PhoenixPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      children: [
        Text('Mon Oeuf', style: AppTextStyles.titleLarge),
        SizedBox(height: AppSpacing.sm),
        Text(
          'Le phenix representera le parcours, pas la performance.',
          style: AppTextStyles.bodyMuted,
        ),
        SizedBox(height: AppSpacing.lg),
        AppCard(child: _EggPreview()),
      ],
    );
  }
}

class _EggPreview extends StatelessWidget {
  const _EggPreview();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 132,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.pill),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.crystalAccent,
                AppColors.lunarAccent,
                AppColors.phoenixAccent,
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: AppColors.lunarGlow,
                blurRadius: 24,
                spreadRadius: 2,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        const Text('Premiere presence', style: AppTextStyles.titleMedium),
        const SizedBox(height: AppSpacing.sm),
        const Text(
          'Les etapes de l oeuf seront definies plus tard, sans logique d evolution pour l instant.',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMuted,
        ),
      ],
    );
  }
}
