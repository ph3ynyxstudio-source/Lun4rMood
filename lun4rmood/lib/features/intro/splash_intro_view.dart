import 'package:flutter/material.dart';

import '../../shared/theme/app_colors.dart';
import '../../shared/theme/app_gradients.dart';
import '../../shared/theme/app_radius.dart';
import '../../shared/theme/app_shadows.dart';
import '../../shared/theme/app_spacing.dart';
import '../../shared/theme/app_text_styles.dart';

class SplashIntroView extends StatelessWidget {
  const SplashIntroView({
    super.key,
    this.onEnter,
  });

  final VoidCallback? onEnter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: DecoratedBox(
        decoration: const BoxDecoration(gradient: AppGradients.background),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final moonSize = constraints.maxWidth
                  .clamp(180.0, 240.0)
                  .toDouble();

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const _LunarLogo(),
                        const SizedBox(height: AppSpacing.huge),
                        _MoonStage(size: moonSize),
                        const SizedBox(height: AppSpacing.huge),
                        _EnterButton(
                          onPressed: onEnter ??
                              () {
                                Navigator.of(context).maybePop();
                              },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _LunarLogo extends StatelessWidget {
  const _LunarLogo();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            return AppGradients.cyanPink.createShader(bounds);
          },
          child: const Text(
            'Lun△rMood',
            textAlign: TextAlign.center,
            style: AppTextStyles.display,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'PH3YNYX',
          textAlign: TextAlign.center,
          style: AppTextStyles.caption.copyWith(
            color: AppColors.textSecondary,
            letterSpacing: 4,
          ),
        ),
      ],
    );
  }
}

class _MoonStage extends StatelessWidget {
  const _MoonStage({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size + AppSpacing.xxl,
      height: size + AppSpacing.xxl,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size + AppSpacing.xxl,
            height: size + AppSpacing.xxl,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.lunarGlow,
                  Color(0x004CC9D0),
                ],
              ),
            ),
          ),
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const RadialGradient(
                center: Alignment(-0.28, -0.32),
                radius: 0.86,
                colors: [
                  AppColors.lunaWhite,
                  Color(0xFFEAF8FF),
                  AppColors.lunaCyan,
                  AppColors.lunaPurple,
                ],
                stops: [0.0, 0.46, 0.78, 1.0],
              ),
              border: Border.all(color: AppColors.borderStrong),
              boxShadow: AppShadows.lg,
            ),
          ),
          const _PhoenixFutureLayer(),
        ],
      ),
    );
  }
}

class _PhoenixFutureLayer extends StatelessWidget {
  const _PhoenixFutureLayer();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class _EnterButton extends StatelessWidget {
  const _EnterButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: AppGradients.cyanPink,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        boxShadow: AppShadows.md,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xxl,
              vertical: AppSpacing.md,
            ),
            child: Text(
              'Entrer',
              textAlign: TextAlign.center,
              style: AppTextStyles.button.copyWith(color: AppColors.buttonText),
            ),
          ),
        ),
      ),
    );
  }
}
