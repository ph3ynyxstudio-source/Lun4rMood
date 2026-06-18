import 'package:flutter/material.dart';

import '../../../shared/theme/app_spacing.dart';
import '../../../shared/theme/app_text_styles.dart';

class SaveCheckInButton extends StatelessWidget {
  const SaveCheckInButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        ),
        child: const Text(
          'Enregistrer',
          style: AppTextStyles.button,
        ),
      ),
    );
  }
}
