import '../models/privacy/anonymous_daily_entry.dart';
import '../models/user/user_daily_entry.dart';

class UserDailyEntryPrivacyMapper {
  const UserDailyEntryPrivacyMapper._();

  /// Removes short and journal notes from a research export projection.
  static AnonymousDailyEntry toAnonymous(UserDailyEntry entry) {
    return AnonymousDailyEntry(
      date: entry.date,
      emotionLevel: entry.emotionLevel,
      dominantEmotion: entry.dominantEmotion,
      energy: entry.energy,
      stress: entry.stress,
      consumption: entry.consumption,
    );
  }
}
