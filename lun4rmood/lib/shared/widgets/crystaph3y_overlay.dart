import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

// PLACEHOLDERS — à remplacer plus tard par les vrais textes de CrystaPh3y.
// Index aligné sur les onglets de AppShell :
// 0 = Accueil, 1 = Journal, 2 = Statistiques, 3 = Phénix, 4 = Paramètres.
const _messages = [
  'Entre ton ressenti du jour.',
  'Relis ton parcours, un jour à la fois.',
  'Observe tes tendances.',
  '', // Phénix : pas de bulle sur cet écran, il est déjà dédié au phénix
  'Tes réglages, à ton rythme.',
];

class CrystaPh3yOverlay extends StatefulWidget {
  const CrystaPh3yOverlay({
    super.key,
    required this.screenIndex,
    this.onModelLoaded,
  });

  final VoidCallback? onModelLoaded;   // ← AJOUT 1 : nouvelle propriété
  final int screenIndex;

  @override
  State<CrystaPh3yOverlay> createState() => _CrystaPh3yOverlayState();
}

class _CrystaPh3yOverlayState extends State<CrystaPh3yOverlay> {
  late Flutter3DController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Flutter3DController();
  }

  void _onModelLoaded(String address) {
    _controller.playAnimation(animationName: 'ArmatureAction');
    widget.onModelLoaded?.call();   // ← AJOUT 2 : déclenche le callback
  }

  @override
  Widget build(BuildContext context) {
    final message = _messages[widget.screenIndex];

    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).padding.top + 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (message.isNotEmpty) ...[
                _SpeechBubble(text: message),
                const SizedBox(height: AppSpacing.sm),
              ],
              SizedBox(
                width: 150,
                height: 150,
                child: AbsorbPointer(
                  child: Flutter3DViewer(
                    src: 'assets/crystaph3y.glb',
                    controller: _controller,
                    onLoad: _onModelLoaded,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SpeechBubble extends StatelessWidget {
  const _SpeechBubble({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 200),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: AppColors.cardElevated,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: AppColors.crystalGlow,
              blurRadius: 12,
              spreadRadius: -6,
            ),
          ],
        ),
        child: Text(
          text,
          style: AppTextStyles.small,
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
