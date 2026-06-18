import 'package:flutter/material.dart';

import '../../shared/theme/app_spacing.dart';
import '../../shared/theme/app_text_styles.dart';
import '../../shared/widgets/app_card.dart';
import '../../shared/widgets/app_page.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      children: [
        Text('Journal', style: AppTextStyles.titleLarge),
        SizedBox(height: AppSpacing.sm),
        Text(
          'Un espace pour deposer les reflexions, les sensations et les moments importants.',
          style: AppTextStyles.bodyMuted,
        ),
        SizedBox(height: AppSpacing.lg),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nouvelle entree', style: AppTextStyles.titleMedium),
              SizedBox(height: AppSpacing.sm),
              Text(
                'Le bouton de creation sera connecte quand le stockage local sera pret.',
                style: AppTextStyles.bodyMuted,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
