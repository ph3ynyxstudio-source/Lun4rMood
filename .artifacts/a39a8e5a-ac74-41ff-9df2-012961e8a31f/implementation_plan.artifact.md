# Plan de stabilisation de la compilation Android

L'objectif est de corriger l'échec de compilation Gradle (`AndroidLocationsBuildService`) en acceptant les licences Android et en utilisant des versions plus stables des outils de build.

## Modifications proposées

### Environnement
- Tenter d'accepter automatiquement les licences Android via `flutter doctor --android-licenses`.

### Gradle & AGP

#### [MODIFY] [gradle-wrapper.properties](file:///C:/Ph3yNyx.OS/Devs/Lun4rMood/lun4rmood/android/gradle/wrapper/gradle-wrapper.properties)
- Rétrograder Gradle de `9.1.0` vers `8.10.2`.

#### [MODIFY] [settings.gradle.kts](file:///C:/Ph3yNyx.OS/Devs/Lun4rMood/lun4rmood/android/settings.gradle.kts)
- Rétrograder le plugin Android (`com.android.application`) de `9.0.1` vers `8.7.0`.
- Rétrograder le plugin Kotlin de `2.3.20` vers `2.1.0`.

#### [MODIFY] [build.gradle.kts (app)](file:///C:/Ph3yNyx.OS/Devs/Lun4rMood/lun4rmood/android/app/build.gradle.kts)
- Ajuster le `jvmTarget` et les `compileOptions` pour assurer la compatibilité avec Java 17.

## Plan de vérification

### Tests automatisés
- Exécuter `flutter clean`.
- Exécuter `flutter run -d 001491569001043` pour compiler et lancer l'application sur le mobile.
