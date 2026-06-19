import '../date_key.dart';

/// Raw daily data created directly by the user.
class UserDailyEntry {
  UserDailyEntry({
    this.schemaVersion = currentSchemaVersion,
    required DateTime date,
    required this.emotionLevel,
    this.dominantEmotion,
    required this.energy,
    required this.stress,
    required this.consumption,
    this.shortNote,
    this.journalNote,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : date = DateKey.normalize(date),
       createdAt = createdAt.toUtc(),
       updatedAt = updatedAt.toUtc();

  static const int currentSchemaVersion = 1;

  final int schemaVersion;
  final DateTime date;
  final double emotionLevel;
  final String? dominantEmotion;
  final double energy;
  final double stress;
  final double consumption;
  final String? shortNote;
  final String? journalNote;
  final DateTime createdAt;
  final DateTime updatedAt;

  String get dateKey => DateKey.encode(date);

  Map<String, Object?> toJson() {
    return {
      'schemaVersion': schemaVersion,
      'date': dateKey,
      'emotionLevel': emotionLevel,
      'dominantEmotion': dominantEmotion,
      'energy': energy,
      'stress': stress,
      'consumption': consumption,
      'shortNote': shortNote,
      'journalNote': journalNote,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory UserDailyEntry.fromJson(Map<String, Object?> json) {
    return UserDailyEntry(
      schemaVersion: (json['schemaVersion'] as num?)?.toInt() ?? 1,
      date: DateKey.decode(json['date'] as String),
      emotionLevel: (json['emotionLevel'] as num).toDouble(),
      dominantEmotion: json['dominantEmotion'] as String?,
      energy: (json['energy'] as num).toDouble(),
      stress: (json['stress'] as num).toDouble(),
      consumption: (json['consumption'] as num).toDouble(),
      shortNote: json['shortNote'] as String?,
      journalNote: json['journalNote'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}
