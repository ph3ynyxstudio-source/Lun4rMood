# Compatibilité des dépendances avec AGP 9+

## Contexte

Le build Android échouait avec Gradle 9.1.0 / AGP 9+ à cause de dépendances transitives obsolètes tirées par `flutter_3d_controller` en version 1.x.

## Changement effectué

**`pubspec.yaml`** : `flutter_3d_controller: ^1.0.2` → `^2.3.0`

C'est la **seule** modification nécessaire. `flutter_3d_controller` 2.x a changé son implémentation interne : il n'utilise plus `webview_flutter` + `android_intent_plus`, mais `flutter_inappwebview`. Ce changement de dépendance interne a été fait par les mainteneurs du package eux-mêmes, donc la mise à jour de la seule dépendance directe a suffi à propager la résolution correcte dans tout l'arbre de dépendances.

### Dépendances transitives supprimées automatiquement (plus tirées par personne)
- `android_intent_plus 4.0.3` — incompatible AGP 9+, à l'origine du blocage
- `webview_flutter 4.9.0`, `webview_flutter_android 3.16.9`, `webview_flutter_platform_interface`, `webview_flutter_wkwebview`
- `url_launcher` (toutes plateformes) — dépendance transitive d'`android_intent_plus`
- `platform 3.1.6`

### Nouvelles dépendances transitives ajoutées (via `flutter_3d_controller` 2.3.0)
- `flutter_inappwebview` (+ ses sous-packages `_android`, `_ios`, `_macos`, `_web`, `_windows`, `_internal_annotations`, `_platform_interface`)
- `http`, `http_parser`, `typed_data`

### Pourquoi aucun `dependency_overrides` n'a été nécessaire
`android_intent_plus` et `webview_flutter` n'étaient jamais des dépendances directes du projet — c'étaient des dépendances transitives de `flutter_3d_controller` 1.x. En mettant à jour le package racine, le résolveur de dépendances Pub a automatiquement retiré les packages obsolètes et introduit les nouveaux, sans conflit de version à forcer manuellement.

## Vérification effectuée
```bash
flutter pub get      # Résolution sans conflit, 26 dépendances changées
flutter analyze       # 0 erreur — l'API publique de Flutter3DController/Flutter3DViewer est restée stable entre 1.x et 2.x
```

Aucune modification du code Dart (`lib/shared/widgets/crystaph3y_overlay.dart`) n'a été requise : les classes `Flutter3DController` et `Flutter3DViewer` gardent la même signature publique (`playAnimation()`, `src`, `controller`) malgré le changement de backend interne (webview_flutter → flutter_inappwebview).

## Comment vérifier la compatibilité AGP 9 d'une future dépendance

1. **Vérifier la date de dernière publication et le changelog sur pub.dev** — un package non maintenu depuis >1 an est un signal d'alarme pour la compatibilité Gradle/AGP récente.
2. **Chercher les issues GitHub du package avec les mots-clés "AGP 9", "Gradle 9", "namespace"** — les incompatibilités AGP se manifestent généralement par des erreurs de `namespace` manquant ou de `compileSdkVersion` non supporté.
3. **Lancer `flutter pub outdated`** avant tout ajout de dépendance pour repérer les packages qui ont des versions majeures plus récentes non contraintes.
4. **Après tout ajout/mise à jour de package**, toujours enchaîner :
   ```bash
   flutter pub get
   flutter analyze
   flutter run -d <device>   # ou flutter build apk --debug
   ```
   pour confirmer que la résolution de dépendances ET le build Gradle passent, pas seulement l'analyse statique.
5. **Éviter les `dependency_overrides` en premier réflexe** — ils masquent le vrai problème (une dépendance racine obsolète). Toujours essayer de remonter à la dépendance directe en amont et la mettre à jour d'abord ; n'utiliser `dependency_overrides` que si le mainteneur du package racine n'a pas encore publié de fix compatible.
