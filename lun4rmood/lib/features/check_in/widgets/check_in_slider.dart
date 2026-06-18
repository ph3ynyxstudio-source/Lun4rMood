import 'package:flutter/material.dart';

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
              style: const TextStyle(
                color: Color(0xFFE8EEF8),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '$roundedValue/10',
              style: const TextStyle(
                color: Color(0xFF9DB8E8),
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: const Color(0xFF88AFFF),
            inactiveTrackColor: const Color(0xFF263754),
            thumbColor: const Color(0xFFD8E5FF),
            overlayColor: const Color(0x3388AFFF),
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
