/// Visual and application preferences, excluding privacy consent.
class UserSettings {
  UserSettings({
    this.schemaVersion = currentSchemaVersion,
    this.themeId = 'dark',
    Map<String, bool> displayPreferences = const {},
    Map<String, bool> appPreferences = const {},
    required DateTime updatedAt,
  }) : displayPreferences = Map.unmodifiable(displayPreferences),
       appPreferences = Map.unmodifiable(appPreferences),
       updatedAt = updatedAt.toUtc();

  static const int currentSchemaVersion = 1;

  final int schemaVersion;
  final String themeId;
  final Map<String, bool> displayPreferences;
  final Map<String, bool> appPreferences;
  final DateTime updatedAt;

  Map<String, Object?> toJson() {
    return {
      'schemaVersion': schemaVersion,
      'themeId': themeId,
      'displayPreferences': displayPreferences,
      'appPreferences': appPreferences,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory UserSettings.fromJson(Map<String, Object?> json) {
    return UserSettings(
      schemaVersion: (json['schemaVersion'] as num?)?.toInt() ?? 1,
      themeId: json['themeId'] as String? ?? 'dark',
      displayPreferences: _boolMap(json['displayPreferences']),
      appPreferences: _boolMap(json['appPreferences']),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}

Map<String, bool> _boolMap(Object? value) {
  final map = value as Map<Object?, Object?>? ?? const {};
  return map.map((key, item) => MapEntry(key as String, item as bool));
}
