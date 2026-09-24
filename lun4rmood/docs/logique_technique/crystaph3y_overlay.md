# CrystaPh3y Overlay — Logique Technique

## Architecture

`CrystaPh3yOverlay` est un `StatefulWidget` qui encapsule le rendu 3D via `Flutter3DController` du package `flutter_3d_controller` (version `^2.3.0` dans `pubspec.yaml`). Il est monté une seule fois dans `_AppRootState` (`lib/app/app.dart`), au-dessus de l'intro et du shell.

### Composants clés

1. **`Flutter3DController` (`_controller`)**
   - Créé dans `initState()` : `_controller = Flutter3DController();`
   - Aucun `dispose()` n'est défini sur `_CrystaPh3yOverlayState` — le controller ne détient pas de ressource à libérer explicitement dans ce widget

2. **`Flutter3DViewer`**
   - Affiche le modèle chargé depuis `assets/crystaph3y.glb`
   - `onLoad: _onModelLoaded` — callback interne du viewer, déclenché une fois le modèle chargé

3. **`_onModelLoaded(String address)`**
   - Appelle `_controller.playAnimation(animationName: 'ArmatureAction')` **une seule fois**
   - Appelle ensuite `widget.onModelLoaded?.call()` pour notifier le parent (`AppRoot`) que le modèle est prêt
   - **Il n'y a pas de `Timer.periodic` ni de relance périodique dans ce widget.** L'animation `ArmatureAction` boucle nativement dans le fichier GLB ; une seule invocation de `playAnimation` suffit à la lancer

4. **`_messages`** (constante top-level, `List<String>` de 5 éléments)
   - Une entrée par index d'onglet (0 à 4), commentée comme placeholder dans le fichier

5. **`_SpeechBubble`** (`StatelessWidget` privé)
   - Construit uniquement si `_messages[screenIndex]` n'est pas vide

## Flux de propagation de l'onglet actif

```
AppShell._selectTab(index)                         [lib/app/app_shell.dart]
  → setState(() => _selectedIndex = index)          [logique existante, inchangée]
  → widget.onTabChanged?.call(index)

_AppRootState._onTabChanged(index)                  [lib/app/app.dart]
  → setState(() => _currentScreenIndex = index)

_AppRootState.build()
  → AppShell(onTabChanged: _onTabChanged)
  → CrystaPh3yOverlay(onModelLoaded: _onModelLoaded, screenIndex: _currentScreenIndex)

CrystaPh3yOverlay.build()                           [lib/shared/widgets/crystaph3y_overlay.dart]
  → message = _messages[widget.screenIndex]
  → Stack > Positioned(top, right) > Column(crossAxisAlignment: end):
      - si message non vide : [_SpeechBubble(text: message), SizedBox(height: AppSpacing.sm)]
      - SizedBox(150x150) > AbsorbPointer > Flutter3DViewer(onLoad: _onModelLoaded)
```

## Flux de chargement du modèle 3D

```
initState()
  → _controller = Flutter3DController()

build()
  → Flutter3DViewer(src: 'assets/crystaph3y.glb', controller: _controller, onLoad: _onModelLoaded)

[le viewer charge le GLB]
  → _onModelLoaded(address) appelé une seule fois
    → _controller.playAnimation(animationName: 'ArmatureAction')
    → widget.onModelLoaded?.call()
```

## Composants modifiés (bulle contextuelle)

- **`lib/app/app_shell.dart`**
  - `AppShell` reçoit un paramètre optionnel `onTabChanged: ValueChanged<int>?`
  - `_selectTab()` appelle `widget.onTabChanged?.call(index)` après le `setState` existant
  - Aucune modification à la logique de `_selectedIndex` ni à `_MainNavigationBar`

- **`lib/app/app.dart` (`_AppRootState`)**
  - Nouvel état `_currentScreenIndex` (int, défaut `0`)
  - Nouvelle méthode `_onTabChanged(index)` qui met à jour cet état via `setState`
  - `AppShell` reçoit `onTabChanged: _onTabChanged`
  - `CrystaPh3yOverlay` reçoit `screenIndex: _currentScreenIndex`
  - `_onModelLoaded` reste inchangé, indépendant de `screenIndex`

- **`lib/shared/widgets/crystaph3y_overlay.dart`**
  - `CrystaPh3yOverlay` reçoit un paramètre requis `screenIndex: int`
  - Constante top-level `_messages` (liste de 5 `String`)
  - Nouveau widget privé `_SpeechBubble` : `Container` avec fond `AppColors.cardElevated`, bordure `AppColors.border`, `BorderRadius.circular(AppRadius.lg)`, `boxShadow` avec `AppColors.crystalGlow` (ce glow est propre à la bulle, il n'existe pas sur le `SizedBox` du modèle 3D)
  - Le modèle 3D et la bulle sont empilés dans une `Column` (`crossAxisAlignment: end`) à l'intérieur du même `Positioned`
  - Si `_messages[screenIndex]` est vide, `_SpeechBubble` n'est pas construit

## Points d'attention

- Le mapping index ↔ onglet dépend de l'ordre des `NavigationDestination` dans `_MainNavigationBar` (`app_shell.dart`) : Accueil=0, Journal=1, Statistiques=2, Phénix=3, Paramètres=4. Si cet ordre change, `_messages` doit être réaligné en conséquence.
- `_messages` est une liste `const` top-level dans le fichier du widget — facile à repérer et modifier sans toucher à la logique.
- Le rendu du modèle GLB passe par une `WebView` interne au package `flutter_3d_controller` (non visible dans le code du projet, interne au package).

## Dépendances

- `flutter_3d_controller: ^2.3.0` (déclaré dans `pubspec.yaml`, ligne 37)
- Asset déclaré dans `pubspec.yaml` : `assets/crystaph3y.glb`

## Configuration Android

- `android/app/src/main/AndroidManifest.xml` déclare `android:usesCleartextTraffic="true"` sur la balise `<application>`.
- **Raison confirmée et testée (2026-09-10)** : le modèle GLB de CrystaPh3y est rendu par `flutter_3d_controller` via une `WebView` interne au package. Sur Android 9 (API 28) et plus, cette `WebView` bloque par défaut le chargement de fichiers locaux (assets) sans `usesCleartextTraffic="true"`. Sans ce réglage, `Flutter3DViewer` ne charge jamais le GLB, `onLoad`/`_onModelLoaded` ne se déclenche jamais, et donc `onModelLoaded` ne remonte jamais à `AppRoot` — ce qui bloque `_isModelLoaded` à `false` et empêche de sortir de l'écran d'intro (`SplashIntroView` attend `isReady: _isModelLoaded`).
- Le commentaire correspondant est documenté directement au-dessus de la ligne dans `AndroidManifest.xml`.

## Améliorations futures possibles

- Remplacer les textes placeholders de `_messages` par les textes définitifs de CrystaPh3y
- Ajouter une transition animée (fade/slide) lors du changement de message entre deux onglets
- Externaliser `_messages` dans un fichier de localisation si le multilingue est ajouté au projet
