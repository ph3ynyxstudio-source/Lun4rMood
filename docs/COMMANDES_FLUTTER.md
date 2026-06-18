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
flutter run -d <device_id>
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
flutter emulators --launch <emulator_id>
```

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
```
