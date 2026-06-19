import 'package:flutter/material.dart';

import '../../shared/theme/app_colors.dart';
import '../../shared/theme/app_radius.dart';
import '../../shared/theme/app_spacing.dart';
import '../../shared/theme/app_text_styles.dart';
import '../../shared/widgets/app_card.dart';
import '../../shared/widgets/app_page.dart';
import 'widgets/check_in_note_field.dart';
import 'widgets/check_in_slider.dart';
import 'widgets/save_check_in_button.dart';

class CheckInPage extends StatefulWidget {
  const CheckInPage({super.key});

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  final TextEditingController _noteController = TextEditingController();

  double _mood = 6;
  double _energy = 5;
  double _stress = 4;
  double _craving = 3;

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _showStoragePendingMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Check-in pret a etre connecte au stockage local.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(
      children: [
        const _CheckInHeader(),
        const SizedBox(height: AppSpacing.lg),
        _DashboardOverviewCard(
          mood: _mood,
          energy: _energy,
          stress: _stress,
          craving: _craving,
        ),
        const SizedBox(height: AppSpacing.md),
        AppCard(
          child: Column(
            children: [
              CheckInSlider(
                label: 'Humeur',
                value: _mood,
                onChanged: (value) => setState(() => _mood = value),
              ),
              const SizedBox(height: AppSpacing.md),
              CheckInSlider(
                label: 'Energie',
                value: _energy,
                onChanged: (value) => setState(() => _energy = value),
              ),
              const SizedBox(height: AppSpacing.md),
              CheckInSlider(
                label: 'Stress',
                value: _stress,
                onChanged: (value) => setState(() => _stress = value),
              ),
              const SizedBox(height: AppSpacing.md),
              CheckInSlider(
                label: 'Envie ou consommation',
                value: _craving,
                color: AppColors.consumptionAccent,
                onChanged: (value) => setState(() => _craving = value),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        AppCard(
          child: CheckInNoteField(controller: _noteController),
        ),
        const SizedBox(height: AppSpacing.lg),
        SaveCheckInButton(onPressed: _showStoragePendingMessage),
      ],
    );
  }
}

class _CheckInHeader extends StatelessWidget {
  const _CheckInHeader();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dashboard du jour',
          style: AppTextStyles.titleLarge,
        ),
        SizedBox(height: AppSpacing.sm),
        Text(
          'Observe ton etat actuel, puis garde le check-in comme point d entree principal.',
          style: AppTextStyles.bodyMuted,
        ),
      ],
    );
  }
}

class _DashboardOverviewCard extends StatelessWidget {
  const _DashboardOverviewCard({
    required this.mood,
    required this.energy,
    required this.stress,
    required this.craving,
  });

  final double mood;
  final double energy;
  final double stress;
  final double craving;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Etat actuel', style: AppTextStyles.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          const Text(
            'Cette zone pourra devenir le resume principal quand le Check-in passera en premier ecran.',
            style: AppTextStyles.bodyMuted,
          ),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              _DashboardChip(label: 'Humeur', value: mood),
              _DashboardChip(label: 'Energie', value: energy),
              _DashboardChip(label: 'Stress', value: stress),
              _DashboardChip(label: 'Envie', value: craving),
            ],
          ),
        ],
      ),
    );
  }
}

class _DashboardChip extends StatelessWidget {
  const _DashboardChip({
    required this.label,
    required this.value,
  });

  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        '$label ${value.round()}/10',
        style: AppTextStyles.caption.copyWith(color: AppColors.textPrimary),
      ),
    );
  }
}
