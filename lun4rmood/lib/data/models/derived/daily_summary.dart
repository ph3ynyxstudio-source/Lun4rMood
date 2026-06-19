import '../date_key.dart';

/// Locally derived summary kept separate from raw user input.
class DailySummary {
  DailySummary({
    this.schemaVersion = currentSchemaVersion,
    required DateTime date,
    required this.summary,
    List<String> simpleTrends = const [],
    List<String> detectedTags = const [],
    Map<String, double> indicators = const {},
    required DateTime generatedAt,
  }) : date = DateKey.normalize(date),
       simpleTrends = List.unmodifiable(simpleTrends),
       detectedTags = List.unmodifiable(detectedTags),
       indicators = Map.unmodifiable(indicators),
       generatedAt = generatedAt.toUtc();

  static const int currentSchemaVersion = 1;

  final int schemaVersion;
  final DateTime date;
  final String summary;
  final List<String> simpleTrends;
  final List<String> detectedTags;
  final Map<String, double> indicators;
  final DateTime generatedAt;

  Map<String, Object?> toJson() {
    return {
      'schemaVersion': schemaVersion,
      'date': DateKey.encode(date),
      'summary': summary,
      'simpleTrends': simpleTrends,
      'detectedTags': detectedTags,
      'indicators': indicators,
      'generatedAt': generatedAt.toIso8601String(),
    };
  }

  factory DailySummary.fromJson(Map<String, Object?> json) {
    return DailySummary(
      schemaVersion: (json['schemaVersion'] as num?)?.toInt() ?? 1,
      date: DateKey.decode(json['date'] as String),
      summary: json['summary'] as String,
      simpleTrends: _stringList(json['simpleTrends']),
      detectedTags: _stringList(json['detectedTags']),
      indicators: _doubleMap(json['indicators']),
      generatedAt: DateTime.parse(json['generatedAt'] as String),
    );
  }
}

List<String> _stringList(Object? value) {
  return (value as List<Object?>? ?? const [])
      .map((item) => item as String)
      .toList(growable: false);
}

Map<String, double> _doubleMap(Object? value) {
  final map = value as Map<Object?, Object?>? ?? const {};
  return map.map(
    (key, item) => MapEntry(key as String, (item as num).toDouble()),
  );
}
