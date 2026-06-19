/// One explicit consent choice. A null timestamp means no decision was recorded.
class ConsentDecision {
  ConsentDecision({this.enabled = false, DateTime? updatedAt})
    : updatedAt = updatedAt?.toUtc() {
    if (enabled && updatedAt == null) {
      throw ArgumentError('Enabled consent requires updatedAt.');
    }
  }

  final bool enabled;
  final DateTime? updatedAt;

  Map<String, Object?> toJson() {
    return {'enabled': enabled, 'updatedAt': updatedAt?.toIso8601String()};
  }

  factory ConsentDecision.fromJson(Map<String, Object?> json) {
    final timestamp = json['updatedAt'] as String?;
    return ConsentDecision(
      enabled: json['enabled'] as bool? ?? false,
      updatedAt: timestamp == null ? null : DateTime.parse(timestamp),
    );
  }
}

/// Privacy consent stored separately from visual and application preferences.
class ConsentSettings {
  ConsentSettings({
    this.schemaVersion = currentSchemaVersion,
    ConsentDecision? cloudSyncConsent,
    ConsentDecision? analyticsConsent,
    ConsentDecision? researchConsent,
    ConsentDecision? aiFeaturesConsent,
  }) : cloudSyncConsent = cloudSyncConsent ?? ConsentDecision(),
       analyticsConsent = analyticsConsent ?? ConsentDecision(),
       researchConsent = researchConsent ?? ConsentDecision(),
       aiFeaturesConsent = aiFeaturesConsent ?? ConsentDecision();

  static const int currentSchemaVersion = 1;

  final int schemaVersion;
  final ConsentDecision cloudSyncConsent;
  final ConsentDecision analyticsConsent;
  final ConsentDecision researchConsent;
  final ConsentDecision aiFeaturesConsent;

  Map<String, Object?> toJson() {
    return {
      'schemaVersion': schemaVersion,
      'cloudSyncConsent': cloudSyncConsent.toJson(),
      'analyticsConsent': analyticsConsent.toJson(),
      'researchConsent': researchConsent.toJson(),
      'aiFeaturesConsent': aiFeaturesConsent.toJson(),
    };
  }

  factory ConsentSettings.fromJson(Map<String, Object?> json) {
    return ConsentSettings(
      schemaVersion: (json['schemaVersion'] as num?)?.toInt() ?? 1,
      cloudSyncConsent: _decision(json['cloudSyncConsent']),
      analyticsConsent: _decision(json['analyticsConsent']),
      researchConsent: _decision(json['researchConsent']),
      aiFeaturesConsent: _decision(json['aiFeaturesConsent']),
    );
  }
}

ConsentDecision _decision(Object? value) {
  if (value == null) {
    return ConsentDecision();
  }
  return ConsentDecision.fromJson(Map<String, Object?>.from(value as Map));
}
