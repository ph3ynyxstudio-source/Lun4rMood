import 'package:flutter/material.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_text_styles.dart';

class CheckInSlider extends StatelessWidget {
  const CheckInSlider({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.color = AppColors.lunarAccent,
  });

  final String label;
  final double value;
  final ValueChanged<double> onChanged;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final roundedValue = value.round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              '$roundedValue/10',
              style: AppTextStyles.bodyMuted.copyWith(
                color: color,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: color,
            inactiveTrackColor: AppColors.border,
            thumbColor: AppColors.textPrimary,
            overlayColor: color.withAlpha(51),
            trackHeight: 5,
          ),
          child: Slider(
            value: value,
            min: 0,
            max: 10,
            divisions: 10,
            label: '$roundedValue',
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
