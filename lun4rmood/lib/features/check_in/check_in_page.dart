import 'package:flutter/material.dart';

import '../../shared/theme/app_colors.dart';
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
          'Lun△rMood',
          style: TextStyle(
            color: AppColors.lunarAccent,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 0,
          ),
        ),
        SizedBox(height: AppSpacing.md),
        Text(
          'Check-in du jour',
          style: AppTextStyles.titleLarge,
        ),
        SizedBox(height: AppSpacing.sm),
        Text(
          'Prends un moment pour observer ton etat actuel.',
          style: AppTextStyles.bodyMuted,
        ),
      ],
    );
  }
}
