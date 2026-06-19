import 'dart:async';

import '../models/date_key.dart';
import '../models/user/user_daily_entry.dart';
import '../repositories/user_daily_entry_repository.dart';

/// Session-only repository used until a persistent local adapter is selected.
class InMemoryUserDailyEntryRepository implements UserDailyEntryRepository {
  final Map<String, UserDailyEntry> _entries = {};
  final StreamController<List<UserDailyEntry>> _changes =
      StreamController<List<UserDailyEntry>>.broadcast();

  @override
  Future<UserDailyEntry?> getByDate(DateTime date) async {
    return _entries[DateKey.encode(date)];
  }

  @override
  Future<List<UserDailyEntry>> getAll() async {
    return _snapshot();
  }

  @override
  Stream<List<UserDailyEntry>> watchAll() async* {
    yield _snapshot();
    yield* _changes.stream;
  }

  @override
  Future<void> upsert(UserDailyEntry entry) async {
    _entries[entry.dateKey] = entry;
    _changes.add(_snapshot());
  }

  @override
  Future<void> close() async {
    await _changes.close();
  }

  List<UserDailyEntry> _snapshot() {
    final entries = _entries.values.toList()
      ..sort((first, second) => first.date.compareTo(second.date));
    return List.unmodifiable(entries);
  }
}
