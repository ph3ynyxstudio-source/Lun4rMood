# Commandes Flutter habituelles

## FR

### Se placer dans le projet Flutter

Depuis la racine du depot Lun4rMood :

```powershell
cd lun4rmood
```

### Verifier l'installation Flutter

```powershell
flutter doctor
flutter --version
flutter devices
```

### Recuperer les dependances

```powershell
flutter pub get
```

### Lancer l'application

Lister les appareils disponibles :

```powershell
flutter devices
```

Lancer sur Windows :

```powershell
flutter run -d windows
```

Lancer dans Chrome :

```powershell
flutter run -d chrome
```

Lancer sur un appareil ou emulateur precis :

```powershell
flutter run -d REAL_DEVICE_ID
```

Remplacer `REAL_DEVICE_ID` par l'identifiant affiche par `flutter devices`.
Ne pas copier les chevrons `< >` dans PowerShell.

### Voir les changements en temps reel sur Android

Depuis la racine du depot Lun4rMood :

```powershell
cd lun4rmood
flutter pub get
flutter devices
flutter run -d REAL_DEVICE_ID
```

Si le telephone Android est le seul appareil connecte, cette commande suffit souvent :

```powershell
flutter run
```

Pendant que `flutter run` reste ouvert :

- appuyer sur `r` dans le terminal pour faire un hot reload ;
- appuyer sur `R` pour faire un hot restart ;
- appuyer sur `q` pour quitter.

Il n'est pas necessaire de relancer un build complet a chaque modification Dart/UI.
Utiliser `r` pour la plupart des changements visuels.
Utiliser `R` si l'etat de l'application semble bloque ou si un changement ne se voit pas.

Apres une modification de `pubspec.yaml`, l'ajout d'un asset, une modification native Android ou un probleme d'asset non visible, relancer proprement :

```powershell
flutter pub get
flutter run -d REAL_DEVICE_ID
```

### Verifier le code

Analyse statique :

```powershell
flutter analyze
```

Tests :

```powershell
flutter test
```

Formatage :

```powershell
dart format lib test
```

### Nettoyer et reconstruire

Nettoyer les fichiers generes :

```powershell
flutter clean
```

Puis recuperer a nouveau les dependances :

```powershell
flutter pub get
```

### Gerer les dependances

Voir les dependances obsoletes :

```powershell
flutter pub outdated
```

Mettre a jour les dependances compatibles :

```powershell
flutter pub upgrade
```

Ajouter une dependance :

```powershell
flutter pub add <package_name>
```

Ajouter une dependance de developpement :

```powershell
flutter pub add --dev <package_name>
```

Note projet : ne pas ajouter Riverpod, Hive, Firebase ou go_router sans demande explicite.

### Builds utiles

Build Android APK :

```powershell
flutter build apk
```

Build Android App Bundle pour publication :

```powershell
flutter build appbundle
```

Build Web :

```powershell
flutter build web
```

Build Windows :

```powershell
flutter build windows
```

### Emulateurs et logs

Lister les emulateurs :

```powershell
flutter emulators
```

Lancer un emulateur :

```powershell
flutter emulators --launch REAL_EMULATOR_ID
```

Remplacer `REAL_EMULATOR_ID` par l'identifiant affiche par `flutter emulators`.

Voir les logs :

```powershell
flutter logs
```

### Commande de verification rapide conseillee

Avant de terminer une petite modification Flutter :

```powershell
flutter analyze
flutter test
```

## EN

### Enter the Flutter project

From the Lun4rMood repository root:

```powershell
cd lun4rmood
```

### Usual quick check

```powershell
flutter doctor
flutter pub get
flutter analyze
flutter test
```

### Usual run commands

```powershell
flutter devices
flutter run -d windows
flutter run -d chrome
flutter run -d REAL_DEVICE_ID
```

Replace `REAL_DEVICE_ID` with the real id shown by `flutter devices`.
If the Android phone is the only connected device, `flutter run` is usually enough.

While `flutter run` stays open, press `r` for hot reload, `R` for hot restart, and `q` to quit.
You do not need to rebuild after every Dart/UI change.
After editing `pubspec.yaml`, adding assets, or changing native Android files, run `flutter pub get` and start the app again.
