import '../date_key.dart';

/// Free-text-free projection for consented research exports.
/// Additional aggregation may still be required before data is anonymous.
class AnonymousDailyEntry {
  AnonymousDailyEntry({
    this.schemaVersion = currentSchemaVersion,
    required DateTime date,
    required this.emotionLevel,
    this.dominantEmotion,
    required this.energy,
    required this.stress,
    required this.consumption,
  }) : date = DateKey.normalize(date);

  static const int currentSchemaVersion = 1;

  final int schemaVersion;
  final DateTime date;
  final double emotionLevel;
  final String? dominantEmotion;
  final double energy;
  final double stress;
  final double consumption;

  Map<String, Object?> toJson() {
    return {
      'schemaVersion': schemaVersion,
      'date': DateKey.encode(date),
      'emotionLevel': emotionLevel,
      'dominantEmotion': dominantEmotion,
      'energy': energy,
      'stress': stress,
      'consumption': consumption,
    };
  }

  factory AnonymousDailyEntry.fromJson(Map<String, Object?> json) {
    return AnonymousDailyEntry(
      schemaVersion: (json['schemaVersion'] as num?)?.toInt() ?? 1,
      date: DateKey.decode(json['date'] as String),
      emotionLevel: (json['emotionLevel'] as num).toDouble(),
      dominantEmotion: json['dominantEmotion'] as String?,
      energy: (json['energy'] as num).toDouble(),
      stress: (json['stress'] as num).toDouble(),
      consumption: (json['consumption'] as num).toDouble(),
    );
  }
}
