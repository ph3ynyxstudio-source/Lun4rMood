import 'package:flutter_test/flutter_test.dart';
import 'package:lun4rmood/data/local/in_memory_user_daily_entry_repository.dart';
import 'package:lun4rmood/data/models/derived/daily_summary.dart';
import 'package:lun4rmood/data/models/privacy/consent_settings.dart';
import 'package:lun4rmood/data/models/settings/user_settings.dart';
import 'package:lun4rmood/data/models/user/user_daily_entry.dart';
import 'package:lun4rmood/data/privacy/user_daily_entry_privacy_mapper.dart';

void main() {
  test('UserDailyEntry JSON preserves date-only and UTC timestamps', () {
    final entry = _entry(
      shortNote: 'Note courte',
      journalNote: 'Journal libre',
    );

    final restored = UserDailyEntry.fromJson(entry.toJson());

    expect(restored.dateKey, '2026-06-19');
    expect(restored.schemaVersion, UserDailyEntry.currentSchemaVersion);
    expect(restored.shortNote, 'Note courte');
    expect(restored.journalNote, 'Journal libre');
    expect(restored.createdAt.isUtc, isTrue);
  });

  test('repository upserts one canonical entry per date', () async {
    final repository = InMemoryUserDailyEntryRepository();
    addTearDown(repository.close);

    await repository.upsert(_entry(shortNote: 'Première note'));
    await repository.upsert(_entry(shortNote: 'Note mise à jour'));

    final entries = await repository.getAll();
    expect(entries, hasLength(1));
    expect(entries.single.shortNote, 'Note mise à jour');
  });

  test('privacy mapper excludes all free-text notes', () {
    final anonymous = UserDailyEntryPrivacyMapper.toAnonymous(
      _entry(shortNote: 'Privé', journalNote: 'Très privé'),
    ).toJson();

    expect(anonymous.containsKey('shortNote'), isFalse);
    expect(anonymous.containsKey('journalNote'), isFalse);
    expect(anonymous['energy'], 6.0);
  });

  test('consents are disabled and undecided by default', () {
    final settings = ConsentSettings();
    final restored = ConsentSettings.fromJson(settings.toJson());

    expect(restored.cloudSyncConsent.enabled, isFalse);
    expect(restored.analyticsConsent.enabled, isFalse);
    expect(restored.researchConsent.enabled, isFalse);
    expect(restored.aiFeaturesConsent.enabled, isFalse);
    expect(restored.cloudSyncConsent.updatedAt, isNull);
    expect(() => ConsentDecision(enabled: true), throwsArgumentError);
  });

  test('derived summary and user settings support JSON round-trips', () {
    final generatedAt = DateTime.utc(2026, 6, 19, 14);
    final summary = DailySummary(
      date: DateTime(2026, 6, 19),
      summary: 'Journée stable',
      simpleTrends: const ['énergie stable'],
      detectedTags: const ['repos'],
      indicators: const {'energyAverage': 6.0},
      generatedAt: generatedAt,
    );
    final settings = UserSettings(
      displayPreferences: const {'compactJournal': true},
      appPreferences: const {'localAnalytics': false},
      updatedAt: generatedAt,
    );

    final restoredSummary = DailySummary.fromJson(summary.toJson());
    final restoredSettings = UserSettings.fromJson(settings.toJson());

    expect(restoredSummary.indicators['energyAverage'], 6.0);
    expect(restoredSettings.displayPreferences['compactJournal'], isTrue);
    expect(restoredSettings.appPreferences['localAnalytics'], isFalse);
  });
}

UserDailyEntry _entry({String? shortNote, String? journalNote}) {
  final timestamp = DateTime.utc(2026, 6, 19, 12);
  return UserDailyEntry(
    date: DateTime(2026, 6, 19, 23, 30),
    emotionLevel: 7,
    dominantEmotion: 'Calme',
    energy: 6,
    stress: 3,
    consumption: 1,
    shortNote: shortNote,
    journalNote: journalNote,
    createdAt: timestamp,
    updatedAt: timestamp,
  );
}
