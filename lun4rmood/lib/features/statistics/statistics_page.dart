import 'package:flutter/material.dart';

import '../../shared/theme/app_colors.dart';
import '../../shared/theme/app_radius.dart';
import '../../shared/theme/app_spacing.dart';
import '../../shared/theme/app_text_styles.dart';
import '../../shared/widgets/app_card.dart';
import '../../shared/widgets/app_page.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      children: [
        Text('Statistiques', style: AppTextStyles.titleLarge),
        SizedBox(height: AppSpacing.sm),
        Text(
          'Cette page affichera les tendances quand les donnees locales seront disponibles.',
          style: AppTextStyles.bodyMuted,
        ),
        SizedBox(height: AppSpacing.lg),
        _MetricCard(title: 'Humeur moyenne', value: '-- /10'),
        SizedBox(height: AppSpacing.md),
        _MetricCard(title: 'Energie', value: '-- /10'),
        SizedBox(height: AppSpacing.md),
        _MetricCard(title: 'Stress', value: '-- /10'),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.body),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.pill),
            ),
            child: Text(value, style: AppTextStyles.caption),
          ),
        ],
      ),
    );
  }
}
