# Lun4rMood Data Architecture

## FR

### Principe

Lun4rMood reste Local First. Les modèles persistables et échangeables vivent sous `lib/data/models/`. Les features consomment ces modèles via des repositories et ne créent pas de seconde source de vérité.

### Responsabilités

- `UserDailyEntry` : données brutes créées par l'utilisateur. Une date `YYYY-MM-DD` correspond à une entrée canonique.
- `DailySummary` : résumé, tendances, tags et indicateurs calculés localement. Aucun texte brut utilisateur n'y est copié automatiquement.
- `UserSettings` : thème et préférences d'interface ou d'application.
- `ConsentSettings` : consentements cloud, analytics, recherche et fonctionnalités IA, séparés des préférences. Tous sont désactivés et sans date par défaut.
- `AnonymousDailyEntry` : projection sans note courte ni note Journal. Cette projection ne garantit pas seule une anonymisation complète.

Les futurs `InsightRecord`, `PhoenixState` et `LocalUsageEvent` devront rester dans des modèles séparés. `PhoenixState` ne devra contenir aucune donnée personnelle brute. `LocalUsageEvent` ne devra contenir aucune émotion, note ou contenu sensible.

### Flux MVP actuel

```text
Capture rapide
  -> UserDailyEntry
  -> UserDailyEntryRepository
  -> InMemoryUserDailyEntryRepository
  -> Journal
```

Le repository en mémoire valide le flux pendant la session seulement. Il ne persiste rien au redémarrage et pourra être remplacé par un adaptateur local sans changer les features.

### JSON et migrations

- dates quotidiennes : `YYYY-MM-DD` ;
- timestamps : ISO-8601 UTC ;
- `schemaVersion` présent dès la version 1 ;
- sérialisation manuelle `toJson` / `fromJson`, sans codegen ;
- export brut : `UserDailyEntry.toJson()` ;
- projection sans textes libres : `UserDailyEntryPrivacyMapper.toAnonymous(...)`.

### Confidentialité

Aucune donnée n'est envoyée hors de l'appareil. Firebase, Hive, analytics externes et moteurs IA ne sont pas intégrés. Un consentement absent reste un refus implicite d'activation, jamais une autorisation supposée.

## EN

### Principle

Lun4rMood remains Local First. Persistable and exchangeable models live under `lib/data/models/`. Features consume them through repositories and do not create a second source of truth.

### Responsibilities

- `UserDailyEntry`: raw user-created data. One `YYYY-MM-DD` date maps to one canonical entry.
- `DailySummary`: locally derived summary, trends, tags, and indicators. Raw user text is not copied automatically.
- `UserSettings`: visual theme and UI or application preferences.
- `ConsentSettings`: cloud, analytics, research, and AI-feature consent, separate from preferences. Every consent is disabled and undecided by default.
- `AnonymousDailyEntry`: projection without short or Journal notes. This projection alone does not guarantee full anonymization.

Future `InsightRecord`, `PhoenixState`, and `LocalUsageEvent` models must remain separate. `PhoenixState` must not contain raw personal data. `LocalUsageEvent` must not contain emotions, notes, or sensitive content.

### Current MVP flow

```text
Quick capture
  -> UserDailyEntry
  -> UserDailyEntryRepository
  -> InMemoryUserDailyEntryRepository
  -> Journal
```

The in-memory repository validates the session flow only. It does not persist across restarts and can later be replaced by a local adapter without changing features.

### JSON and migrations

- daily dates: `YYYY-MM-DD`;
- timestamps: ISO-8601 UTC;
- `schemaVersion` starts at version 1;
- manual `toJson` / `fromJson`, without code generation;
- raw export: `UserDailyEntry.toJson()`;
- free-text-free projection: `UserDailyEntryPrivacyMapper.toAnonymous(...)`.

### Privacy

No data leaves the device. Firebase, Hive, external analytics, and AI engines are not integrated. Missing consent never enables a feature or data transfer.
