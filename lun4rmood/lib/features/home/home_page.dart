import 'package:flutter/material.dart';

import '../../data/repositories/user_daily_entry_repository.dart';
import '../../shared/theme/app_colors.dart';
import '../../shared/theme/app_gradients.dart';
import '../../shared/theme/app_shadows.dart';
import '../../shared/theme/app_spacing.dart';
import '../../shared/theme/app_text_styles.dart';
import '../../shared/widgets/app_card.dart';
import '../../shared/widgets/app_page.dart';
import '../check_in/widgets/check_in_quick_entry.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.repository});

  final UserDailyEntryRepository repository;

  static const String _moonAsset = 'assets/moons/moon_waxing_crescent.webp';
  static const Color _dashboardCardColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    final dateLabel = _formatFrenchDate(date);

    return AppPage(
      children: [
        const _MoonPhaseSection(moonAsset: _moonAsset),
        const SizedBox(height: AppSpacing.lg),
        CheckInQuickEntry(
          date: date,
          dateLabel: dateLabel,
          repository: repository,
          boxShadow: AppShadows.none,
        ),
        const SizedBox(height: AppSpacing.md),
        const _DailySummaryCard(),
      ],
    );
  }

  String _formatFrenchDate(DateTime date) {
    const weekdays = [
      'lundi',
      'mardi',
      'mercredi',
      'jeudi',
      'vendredi',
      'samedi',
      'dimanche',
    ];
    const months = [
      'janvier',
      'fevrier',
      'mars',
      'avril',
      'mai',
      'juin',
      'juillet',
      'aout',
      'septembre',
      'octobre',
      'novembre',
      'decembre',
    ];

    return '${weekdays[date.weekday - 1]} ${date.day} ${months[date.month - 1]}';
  }
}

class _MoonPhaseSection extends StatelessWidget {
  const _MoonPhaseSection({required this.moonAsset});

  final String moonAsset;

  @override
  Widget build(BuildContext context) {
    final moonSize = (MediaQuery.sizeOf(context).width * 0.44)
        .clamp(96.0, 184.0)
        .toDouble();

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: moonSize,
            height: moonSize,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: AppShadows.lg,
            ),
            child: Image.asset(
              moonAsset,
              fit: BoxFit.contain,
              semanticLabel: 'Premier croissant lunaire',
              errorBuilder: (context, error, stackTrace) {
                return const DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      center: Alignment(0.35, -0.25),
                      colors: [
                        AppColors.crystalAccent,
                        AppColors.backgroundDeep,
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const Text('PHASE ACTUELLE', style: AppTextStyles.caption),
          const SizedBox(height: AppSpacing.xs),
          ShaderMask(
            shaderCallback: AppGradients.cyanPink.createShader,
            blendMode: BlendMode.srcIn,
            child: Text(
              'Premier\nCroissant',
              textAlign: TextAlign.center,
              style: AppTextStyles.display.copyWith(
                color: AppColors.lunaWhite,
                height: 1.05,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Jour du cycle 4',
            style: AppTextStyles.caption.copyWith(color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}

class _DailySummaryCard extends StatelessWidget {
  const _DailySummaryCard();

  @override
  Widget build(BuildContext context) {
    return const AppCard(
      backgroundColor: HomePage._dashboardCardColor,
      boxShadow: AppShadows.none,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('RESUME DU JOUR', style: AppTextStyles.caption),
          SizedBox(height: AppSpacing.md),
          _SummaryLine(
            icon: Icons.sentiment_satisfied_alt,
            label: 'Emotion',
            value: '6.2 / 10',
            color: AppColors.phoenixAccent,
          ),
          _SummaryDivider(),
          _SummaryLine(
            icon: Icons.bolt,
            label: 'Energie',
            value: '5 / 10',
            color: AppColors.lunarAccent,
          ),
          _SummaryDivider(),
          _SummaryLine(
            icon: Icons.local_drink_outlined,
            label: 'Consommation',
            value: '3 / 10',
            color: AppColors.consumptionAccent,
          ),
        ],
      ),
    );
  }
}

class _SummaryLine extends StatelessWidget {
  const _SummaryLine({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _IconBubble(icon: icon, color: color, size: 34),
        const SizedBox(width: AppSpacing.md),
        Expanded(child: Text(label, style: AppTextStyles.body)),
        Text(
          value,
          style: AppTextStyles.body.copyWith(
            color: color,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _SummaryDivider extends StatelessWidget {
  const _SummaryDivider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Divider(color: AppColors.border, height: 1),
    );
  }
}

class _IconBubble extends StatelessWidget {
  const _IconBubble({required this.icon, required this.color, this.size = 42});

  final IconData icon;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withAlpha(31),
        shape: BoxShape.circle,
        border: Border.all(color: color.withAlpha(140)),
      ),
      child: Icon(icon, color: color, size: size * 0.52),
    );
  }
}
