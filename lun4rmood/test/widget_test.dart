import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lun4rmood/app/app.dart';
import 'package:lun4rmood/data/local/in_memory_user_daily_entry_repository.dart';
import 'package:lun4rmood/data/models/user/user_daily_entry.dart';
import 'package:lun4rmood/features/check_in/widgets/check_in_quick_entry.dart';
import 'package:lun4rmood/features/journal/journal_page.dart';

void main() {
  testWidgets('Lun4rMood shell renders main navigation', (tester) async {
    await tester.pumpWidget(const Lun4rMoodApp());

    expect(find.text('Accueil'), findsOneWidget);
    expect(find.text('Check-in'), findsNothing);
    expect(find.text('Journal'), findsOneWidget);
    expect(find.text('Statistiques'), findsOneWidget);
    expect(find.text('Phénix'), findsOneWidget);
    expect(find.text('Paramètres'), findsOneWidget);
  });

  testWidgets('Quick capture is collapsed and expands on tap', (tester) async {
    final repository = InMemoryUserDailyEntryRepository();
    addTearDown(repository.close);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: CheckInQuickEntry(
              date: DateTime(2026, 6, 19),
              dateLabel: 'vendredi 19 juin',
              repository: repository,
            ),
          ),
        ),
      ),
    );

    expect(find.text('CAPTURE RAPIDE'), findsOneWidget);
    expect(find.text('Stress'), findsNothing);

    await tester.tap(find.text('CAPTURE RAPIDE'));
    await tester.pumpAndSettle();

    expect(find.text('Stress'), findsOneWidget);
    expect(find.text('Enregistrer'), findsOneWidget);

    await tester.tap(find.text('Enregistrer'));
    await tester.pumpAndSettle();

    final savedEntry = await repository.getByDate(DateTime(2026, 6, 19));
    expect(savedEntry, isNotNull);
    expect(savedEntry!.dateKey, '2026-06-19');
  });

  testWidgets('Journal selects a day and displays its entry', (tester) async {
    final repository = InMemoryUserDailyEntryRepository();
    addTearDown(repository.close);
    final timestamp = DateTime.utc(2026, 6, 18, 12);
    final entry = UserDailyEntry(
      date: DateTime(2026, 6, 18),
      emotionLevel: 7,
      dominantEmotion: 'Calme',
      energy: 6,
      stress: 3,
      consumption: 1,
      shortNote: 'Journée stable.',
      createdAt: timestamp,
      updatedAt: timestamp,
    );
    await repository.upsert(entry);

    await tester.pumpWidget(
      MaterialApp(
        home: JournalPage(
          repository: repository,
          referenceDate: DateTime(2026, 6, 19),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Aucune entrée pour cette journée.'), findsOneWidget);
    expect(find.text('Calme'), findsNothing);

    await tester.tap(find.text('18'));
    await tester.pump();

    expect(find.text('Calme'), findsOneWidget);
    expect(find.text('Journée stable.'), findsOneWidget);
  });
}
