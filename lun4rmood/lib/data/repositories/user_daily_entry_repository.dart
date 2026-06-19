import '../models/user/user_daily_entry.dart';

abstract interface class UserDailyEntryRepository {
  Future<UserDailyEntry?> getByDate(DateTime date);

  Future<List<UserDailyEntry>> getAll();

  Stream<List<UserDailyEntry>> watchAll();

  Future<void> upsert(UserDailyEntry entry);

  Future<void> close();
}
