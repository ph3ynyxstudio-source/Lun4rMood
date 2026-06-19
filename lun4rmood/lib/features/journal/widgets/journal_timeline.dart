import 'package:flutter/material.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_radius.dart';
import '../../../shared/theme/app_spacing.dart';
import '../../../shared/theme/app_text_styles.dart';

class JournalTimeline extends StatelessWidget {
  const JournalTimeline({
    super.key,
    required this.days,
    required this.selectedDate,
    required this.onDateSelected,
  });

  final List<DateTime> days;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: ListView.separated(
        reverse: true,
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        separatorBuilder: (context, index) =>
            const SizedBox(width: AppSpacing.sm),
        itemBuilder: (context, index) {
          final date = days[index];
          final isSelected = _isSameDay(date, selectedDate);

          return Semantics(
            button: true,
            selected: isSelected,
            label: '${_weekdayLabel(date)}, ${date.day}',
            child: GestureDetector(
              onTap: () => onDateSelected(date),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: 68,
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.surface : AppColors.card,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.lunarAccent.withAlpha(140)
                        : AppColors.cardBorder,
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _weekdayLabel(date),
                      style: AppTextStyles.caption.copyWith(
                        color: isSelected
                            ? AppColors.lunarAccent
                            : AppColors.textMuted,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      '${date.day}',
                      style: AppTextStyles.titleSmall.copyWith(
                        color: isSelected
                            ? AppColors.textPrimary
                            : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  static bool _isSameDay(DateTime first, DateTime second) {
    return first.year == second.year &&
        first.month == second.month &&
        first.day == second.day;
  }
}

String _weekdayLabel(DateTime date) {
  const labels = ['lun', 'mar', 'mer', 'jeu', 'ven', 'sam', 'dim'];
  return labels[date.weekday - 1];
}
