import 'package:flutter/material.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_text_styles.dart';

class CheckInSlider extends StatelessWidget {
  const CheckInSlider({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final double value;
  final ValueChanged<double> onChanged;

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
                color: AppColors.lunarAccent,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColors.lunarAccent,
            inactiveTrackColor: AppColors.border,
            thumbColor: AppColors.textPrimary,
            overlayColor: AppColors.lunarOverlay,
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
