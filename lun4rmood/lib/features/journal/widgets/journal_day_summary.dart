import 'package:flutter/material.dart';

import '../../../data/models/user/user_daily_entry.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_spacing.dart';
import '../../../shared/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';

class JournalDaySummary extends StatelessWidget {
  const JournalDaySummary({super.key, required this.date, required this.entry});

  final DateTime date;
  final UserDailyEntry? entry;

  @override
  Widget build(BuildContext context) {
    final selectedEntry = entry;

    if (selectedEntry == null) {
      return AppCard(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xl,
        ),
        child: Column(
          children: [
            const Icon(
              Icons.event_note_outlined,
              color: AppColors.textMuted,
              size: 30,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              _longDateLabel(date),
              style: AppTextStyles.small,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
            const Text(
              'Aucune entrée pour cette journée.',
              style: AppTextStyles.bodyMuted,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    final notes = [
      selectedEntry.shortNote,
      selectedEntry.journalNote,
    ].whereType<String>().where((note) => note.trim().isNotEmpty).toList();

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_longDateLabel(date), style: AppTextStyles.titleSmall),
          const SizedBox(height: AppSpacing.md),
          _JournalMetricRow(
            icon: Icons.sentiment_satisfied_alt,
            label: 'Émotion dominante',
            value:
                selectedEntry.dominantEmotion ??
                _levelLabel(selectedEntry.emotionLevel),
            color: AppColors.phoenixAccent,
          ),
          const _JournalDivider(),
          _JournalMetricRow(
            icon: Icons.bolt,
            label: 'Énergie',
            value: _levelLabel(selectedEntry.energy),
            color: AppColors.lunarAccent,
          ),
          const _JournalDivider(),
          _JournalMetricRow(
            icon: Icons.air,
            label: 'Stress',
            value: _levelLabel(selectedEntry.stress),
            color: AppColors.crystalAccent,
          ),
          const _JournalDivider(),
          _JournalMetricRow(
            icon: Icons.local_drink_outlined,
            label: 'Consommation',
            value: _levelLabel(selectedEntry.consumption),
            color: AppColors.consumptionAccent,
          ),
          const SizedBox(height: AppSpacing.lg),
          const Text('NOTES COURTES', style: AppTextStyles.caption),
          const SizedBox(height: AppSpacing.sm),
          if (notes.isEmpty)
            const Text('Aucune note courte.', style: AppTextStyles.bodyMuted)
          else
            ...notes.map(
              (note) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Icon(
                        Icons.circle,
                        color: AppColors.textMuted,
                        size: 5,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(child: Text(note, style: AppTextStyles.body)),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _JournalMetricRow extends StatelessWidget {
  const _JournalMetricRow({
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
        Icon(icon, color: color, size: 22),
        const SizedBox(width: AppSpacing.md),
        Expanded(child: Text(label, style: AppTextStyles.body)),
        Text(
          value,
          style: AppTextStyles.body.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _JournalDivider extends StatelessWidget {
  const _JournalDivider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Divider(color: AppColors.cardBorder, height: 1),
    );
  }
}

String _longDateLabel(DateTime date) {
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
    'février',
    'mars',
    'avril',
    'mai',
    'juin',
    'juillet',
    'août',
    'septembre',
    'octobre',
    'novembre',
    'décembre',
  ];

  return '${weekdays[date.weekday - 1]} ${date.day} ${months[date.month - 1]}';
}

String _levelLabel(double value) {
  final formatted = value == value.roundToDouble()
      ? value.round().toString()
      : value.toStringAsFixed(1);
  return '$formatted / 10';
}
