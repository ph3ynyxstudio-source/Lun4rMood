import 'package:flutter/material.dart';

import '../../shared/theme/app_spacing.dart';
import '../../shared/theme/app_text_styles.dart';
import '../../shared/widgets/app_card.dart';
import '../../shared/widgets/app_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      children: [
        Text('Parametres', style: AppTextStyles.titleLarge),
        SizedBox(height: AppSpacing.sm),
        Text(
          'Les reglages resteront centres sur le controle local et la clarte des donnees.',
          style: AppTextStyles.bodyMuted,
        ),
        SizedBox(height: AppSpacing.lg),
        _SettingsSection(title: 'Donnees locales'),
        SizedBox(height: AppSpacing.md),
        _SettingsSection(title: 'Export'),
        SizedBox(height: AppSpacing.md),
        _SettingsSection(title: 'Compte optionnel plus tard'),
        SizedBox(height: AppSpacing.md),
        _SettingsSection(title: 'Apparence'),
      ],
    );
  }
}

class _SettingsSection extends StatelessWidget {
  const _SettingsSection({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Text(title, style: AppTextStyles.body),
    );
  }
}
