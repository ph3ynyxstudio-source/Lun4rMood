import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';
import 'app_logo_header.dart';
import 'starry_background.dart';

class AppPage extends StatelessWidget {
  const AppPage({
    super.key,
    required this.children,
    this.showLogo = true,
  });

  final List<Widget> children;
  final bool showLogo;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: StarryBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.lg,
              AppSpacing.lg,
              AppSpacing.xl,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showLogo) const AppLogoPageHeader(),
                ...children,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
