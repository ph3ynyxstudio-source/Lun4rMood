import 'package:flutter/material.dart';

import '../../../data/models/user/user_daily_entry.dart';
import '../../../data/repositories/user_daily_entry_repository.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_spacing.dart';
import '../../../shared/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import 'check_in_note_field.dart';
import 'check_in_slider.dart';
import 'save_check_in_button.dart';

class CheckInQuickEntry extends StatefulWidget {
  const CheckInQuickEntry({
    super.key,
    required this.date,
    required this.dateLabel,
    required this.repository,
    this.backgroundColor,
    this.borderColor,
    this.boxShadow,
  });

  final DateTime date;
  final String dateLabel;
  final UserDailyEntryRepository repository;
  final Color? backgroundColor;
  final Color? borderColor;
  final List<BoxShadow>? boxShadow;

  @override
  State<CheckInQuickEntry> createState() => _CheckInQuickEntryState();
}

class _CheckInQuickEntryState extends State<CheckInQuickEntry> {
  static const Duration _animationDuration = Duration(milliseconds: 250);

  final TextEditingController _noteController = TextEditingController();

  bool _isExpanded = false;
  double _mood = 6;
  double _energy = 5;
  double _stress = 4;
  double _craving = 3;

  @override
  void initState() {
    super.initState();
    _loadEntry();
  }

  @override
  void didUpdateWidget(covariant CheckInQuickEntry oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.repository != widget.repository ||
        !_isSameDay(oldWidget.date, widget.date)) {
      _loadEntry();
    }
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _loadEntry() async {
    final entry = await widget.repository.getByDate(widget.date);
    if (!mounted || entry == null) {
      return;
    }

    setState(() {
      _mood = entry.emotionLevel;
      _energy = entry.energy;
      _stress = entry.stress;
      _craving = entry.consumption;
      _noteController.text = entry.shortNote ?? '';
    });
  }

  Future<void> _saveEntry() async {
    final existing = await widget.repository.getByDate(widget.date);
    final now = DateTime.now().toUtc();

    await widget.repository.upsert(
      UserDailyEntry(
        date: widget.date,
        emotionLevel: _mood,
        dominantEmotion: existing?.dominantEmotion,
        energy: _energy,
        stress: _stress,
        consumption: _craving,
        shortNote: _optionalText(_noteController.text),
        journalNote: existing?.journalNote,
        createdAt: existing?.createdAt ?? now,
        updatedAt: now,
      ),
    );

    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Entrée enregistrée localement pour cette session.'),
      ),
    );
  }

  void _toggleExpanded() {
    setState(() => _isExpanded = !_isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      backgroundColor: widget.backgroundColor,
      borderColor: widget.borderColor,
      boxShadow: widget.boxShadow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Semantics(
            button: true,
            label: _isExpanded
                ? 'Fermer la capture rapide'
                : 'Ouvrir la capture rapide',
            child: InkWell(
              onTap: _toggleExpanded,
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColors.lunarOverlay,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.cardBorder, width: 1),
                    ),
                    child: const Icon(
                      Icons.auto_awesome,
                      color: AppColors.lunarAccent,
                      size: 21,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'CAPTURE RAPIDE',
                          style: AppTextStyles.caption,
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(widget.dateLabel, style: AppTextStyles.body),
                      ],
                    ),
                  ),
                  AnimatedRotation(
                    turns: _isExpanded ? 0.25 : 0,
                    duration: _animationDuration,
                    curve: Curves.easeInOut,
                    child: const Icon(
                      Icons.chevron_right,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: _animationDuration,
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: _isExpanded
                ? Column(
                    children: [
                      const SizedBox(height: AppSpacing.md),
                      CheckInSlider(
                        label: 'Emotion',
                        value: _mood,
                        color: AppColors.phoenixAccent,
                        onChanged: (value) => setState(() => _mood = value),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      CheckInSlider(
                        label: 'Energie',
                        value: _energy,
                        color: AppColors.lunarAccent,
                        onChanged: (value) => setState(() => _energy = value),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      CheckInSlider(
                        label: 'Stress',
                        value: _stress,
                        color: AppColors.crystalAccent,
                        onChanged: (value) => setState(() => _stress = value),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      CheckInSlider(
                        label: 'Consommation',
                        value: _craving,
                        color: AppColors.consumptionAccent,
                        onChanged: (value) => setState(() => _craving = value),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      CheckInNoteField(controller: _noteController),
                      const SizedBox(height: AppSpacing.md),
                      SaveCheckInButton(onPressed: _saveEntry),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  static String? _optionalText(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  static bool _isSameDay(DateTime first, DateTime second) {
    return first.year == second.year &&
        first.month == second.month &&
        first.day == second.day;
  }
}
