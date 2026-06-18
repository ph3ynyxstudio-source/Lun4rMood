import 'package:flutter/material.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_radius.dart';
import '../../../shared/theme/app_text_styles.dart';

class CheckInNoteField extends StatelessWidget {
  const CheckInNoteField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: 3,
      maxLines: 5,
      maxLength: 220,
      style: AppTextStyles.body,
      decoration: InputDecoration(
        labelText: 'Note courte',
        hintText: 'Un mot, une sensation, une observation...',
        labelStyle: AppTextStyles.bodyMuted,
        hintStyle: AppTextStyles.caption,
        counterStyle: AppTextStyles.caption,
        filled: true,
        fillColor: AppColors.surface,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: const BorderSide(color: AppColors.lunarAccent),
        ),
      ),
    );
  }
}
