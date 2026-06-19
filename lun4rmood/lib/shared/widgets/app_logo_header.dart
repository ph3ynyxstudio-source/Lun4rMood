import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';

class AppLogoHeader extends StatelessWidget {
  const AppLogoHeader({super.key});

  static const String assetPath = 'web/icons/Typo_marketing.png';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        assetPath,
        width: 176,
        fit: BoxFit.contain,
        semanticLabel: 'Lun△rMood',
        errorBuilder: (context, error, stackTrace) {
          return const Text(
            'Lun△rMood',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w600,
              letterSpacing: 0,
            ),
          );
        },
      ),
    );
  }
}

class AppLogoPageHeader extends StatelessWidget {
  const AppLogoPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppLogoHeader(),
        SizedBox(height: AppSpacing.xl),
      ],
    );
  }
}
