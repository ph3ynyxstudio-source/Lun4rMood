import 'dart:async';

import 'package:flutter/material.dart';

import '../../data/models/user/user_daily_entry.dart';
import '../../data/repositories/user_daily_entry_repository.dart';
import '../../shared/theme/app_spacing.dart';
import '../../shared/theme/app_text_styles.dart';
import '../../shared/widgets/app_page.dart';
import 'widgets/journal_day_summary.dart';
import 'widgets/journal_timeline.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key, required this.repository, this.referenceDate});

  final UserDailyEntryRepository repository;
  final DateTime? referenceDate;

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  static const int _timelineLength = 14;

  late DateTime _selectedDate;
  late StreamSubscription<List<UserDailyEntry>> _subscription;
  List<UserDailyEntry> _entries = const [];

  DateTime get _referenceDate =>
      _dateOnly(widget.referenceDate ?? DateTime.now());

  List<DateTime> get _timelineDays => List.generate(
    _timelineLength,
    (index) => _referenceDate.subtract(Duration(days: index)),
  );

  UserDailyEntry? get _selectedEntry {
    for (final entry in _entries) {
      if (_isSameDay(entry.date, _selectedDate)) {
        return entry;
      }
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _selectedDate = _referenceDate;
    _subscribe();
  }

  @override
  void didUpdateWidget(covariant JournalPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.referenceDate != widget.referenceDate) {
      _selectedDate = _referenceDate;
    }
    if (oldWidget.repository != widget.repository) {
      unawaited(_subscription.cancel());
      _subscribe();
    }
  }

  @override
  void dispose() {
    unawaited(_subscription.cancel());
    super.dispose();
  }

  void _subscribe() {
    _subscription = widget.repository.watchAll().listen((entries) {
      if (!mounted) {
        return;
      }
      setState(() => _entries = entries);
    });
  }

  void _selectDate(DateTime date) {
    setState(() => _selectedDate = _dateOnly(date));
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(
      children: [
        const Text('Journal', style: AppTextStyles.titleLarge),
        const SizedBox(height: AppSpacing.sm),
        const Text(
          'Relis tes observations quotidiennes, une journée à la fois.',
          style: AppTextStyles.bodyMuted,
        ),
        const SizedBox(height: AppSpacing.lg),
        JournalTimeline(
          days: _timelineDays,
          selectedDate: _selectedDate,
          onDateSelected: _selectDate,
        ),
        const SizedBox(height: AppSpacing.lg),
        JournalDaySummary(date: _selectedDate, entry: _selectedEntry),
      ],
    );
  }

  static DateTime _dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  static bool _isSameDay(DateTime first, DateTime second) {
    return first.year == second.year &&
        first.month == second.month &&
        first.day == second.day;
  }
}
