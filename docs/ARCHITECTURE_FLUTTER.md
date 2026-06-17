# Flutter Architecture

## FR

### Vision d'architecture

L'architecture de Lun4rMood doit rester simple, lisible et adaptee a un developpement solo.
Le projet doit pouvoir evoluer sans melanger l'interface, la logique produit et la gestion des donnees.

Le principe general est de construire une application Local First, ou les donnees utilisateur restent d'abord sur l'appareil.
Les services externes, comme Firebase, pourront etre ajoutes plus tard si le besoin est confirme.

Les technologies prevues pour la suite sont Flutter, Dart, Riverpod, Hive, Firebase optionnel et go_router.
Riverpod, Hive, Firebase et go_router ne sont pas encore ajoutes maintenant.

### Separation prevue

- `app` : point d'assemblage de l'application, configuration generale et future navigation.
- `features` : ecrans et parcours fonctionnels, par exemple check-in, journal, statistiques, phoenix et reglages.
- `engine` : logique metier interne, calculs, insights et regles d'evolution du phoenix personnel.
- `data` : acces aux donnees locales, stockage, repositories, export et future sauvegarde optionnelle.
- `models` : objets de donnees du domaine, par exemple entree d'humeur, entree de journal, profil phoenix ou reglages.
- `shared` : widgets partages, theme, utilitaires et helpers reutilisables.

### Future arborescence cible

```text
lib/
  main.dart
  app/
    app.dart
    router.dart
  features/
    check_in/
    journal/
    statistics/
    phoenix/
    settings/
  engine/
    mood_engine.dart
    insight_engine.dart
    phoenix_engine.dart
  data/
    local/
    firebase/
    repositories/
  models/
    mood_entry.dart
    journal_entry.dart
    phoenix_profile.dart
    user_settings.dart
  shared/
    widgets/
    theme/
    utils/
```

### Note d'implementation

Cette structure est une cible de travail.
Elle n'est pas encore entierement implementee dans le projet Flutter actuel.
Les changements devront etre faits progressivement, sans modifier inutilement la logique generee tant que les besoins MVP ne sont pas poses.

## EN

### Architecture vision

Lun4rMood's architecture should remain simple, readable, and suitable for solo development.
The project should be able to grow without mixing UI, product logic, and data handling.

The general principle is to build a Local First app, where user data stays on the device by default.
External services, such as Firebase, can be added later if the need is confirmed.

The planned technologies for later are Flutter, Dart, Riverpod, Hive, optional Firebase, and go_router.
Riverpod, Hive, Firebase, and go_router are not added now.

### Planned separation

- `app`: application assembly point, general configuration, and future navigation.
- `features`: functional screens and flows, such as check-in, journal, statistics, phoenix, and settings.
- `engine`: internal product logic, calculations, insights, and personal phoenix evolution rules.
- `data`: local data access, storage, repositories, export, and future optional backup.
- `models`: domain data objects, such as mood entry, journal entry, phoenix profile, or settings.
- `shared`: shared widgets, theme, utilities, and reusable helpers.

### Future target tree

```text
lib/
  main.dart
  app/
    app.dart
    router.dart
  features/
    check_in/
    journal/
    statistics/
    phoenix/
    settings/
  engine/
    mood_engine.dart
    insight_engine.dart
    phoenix_engine.dart
  data/
    local/
    firebase/
    repositories/
  models/
    mood_entry.dart
    journal_entry.dart
    phoenix_profile.dart
    user_settings.dart
  shared/
    widgets/
    theme/
    utils/
```

### Implementation note

This structure is a target direction.
It is not fully implemented in the current Flutter project yet.
Changes should be made progressively, without changing generated logic unnecessarily before the MVP needs are defined.
