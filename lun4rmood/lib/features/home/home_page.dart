import 'package:flutter/material.dart';

import '../../shared/theme/app_colors.dart';
import '../../shared/theme/app_spacing.dart';
import '../../shared/theme/app_text_styles.dart';
import '../../shared/widgets/app_card.dart';
import '../../shared/widgets/app_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      children: [
        Text('Lun△rMood', style: AppTextStyles.titleLarge),
        SizedBox(height: AppSpacing.sm),
        Text(
          'Observer ton etat, garder une trace, avancer avec douceur.',
          style: AppTextStyles.bodyMuted,
        ),
        SizedBox(height: AppSpacing.lg),
        _TodaySummaryCard(),
        SizedBox(height: AppSpacing.md),
        _NextActionsCard(),
      ],
    );
  }
}

class _TodaySummaryCard extends StatelessWidget {
  const _TodaySummaryCard();

  @override
  Widget build(BuildContext context) {
    return const AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Aujourd hui', style: AppTextStyles.titleMedium),
          SizedBox(height: AppSpacing.sm),
          Text(
            'Ton check-in attend d etre rempli. Les tendances apparaitront quand les donnees locales seront connectees.',
            style: AppTextStyles.bodyMuted,
          ),
        ],
      ),
    );
  }
}

class _NextActionsCard extends StatelessWidget {
  const _NextActionsCard();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Prochaines actions', style: AppTextStyles.titleMedium),
          const SizedBox(height: AppSpacing.md),
          _ActionLine(color: AppColors.lunarAccent, text: 'Faire le check-in'),
          const SizedBox(height: AppSpacing.sm),
          _ActionLine(color: AppColors.crystalAccent, text: 'Ecrire une note'),
          const SizedBox(height: AppSpacing.sm),
          _ActionLine(
            color: AppColors.phoenixAccent,
            text: 'Observer l evolution de l oeuf',
          ),
        ],
      ),
    );
  }
}

class _ActionLine extends StatelessWidget {
  const _ActionLine({
    required this.color,
    required this.text,
  });

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: AppSpacing.sm),
        Text(text, style: AppTextStyles.body),
      ],
    );
  }
}
