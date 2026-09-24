# CrystaPh3y Overlay — Guide Visuel & Interaction

## Positionnement et apparence

Le cristal 3D CrystaPh3y apparaît en **overlay permanent** dans le coin **supérieur droit** de l'écran, monté une seule fois dans `AppRoot` (`lib/app/app.dart`) au-dessus de l'intro et du shell — il est donc visible sur toutes les pages du shell (Accueil, Journal, Statistiques, Phénix, Paramètres).

### Dimensions
- **Taille du modèle 3D** : `SizedBox` de 150×150 pixels (`crystaph3y_overlay.dart`, `build()`)
- Aucune forme (cercle, etc.) n'est appliquée au conteneur du modèle — c'est un `SizedBox` simple sans `decoration`

### Position
- **Top** : `MediaQuery.of(context).padding.top + 16` (safe area + 16 px)
- **Right** : 16 px depuis le bord droit de l'écran

### Effets visuels sur le modèle 3D
- **Aucun** — il n'y a pas de `BoxShadow`/glow sur le `SizedBox` contenant le modèle. Le modèle est enveloppé dans un `AbsorbPointer` (non interactif) puis rendu par `Flutter3DViewer`.

### Visibilité
- **Invisible pendant l'intro** : `Opacity(opacity: 0.0)` tant que `_showIntro == true` dans `AppRoot`
- **Visible une fois dans l'app** : `Opacity(opacity: 1.0)` après le splash

### Animation
- `playAnimation(animationName: 'ArmatureAction')` est appelé **une seule fois**, dans `onLoad` du `Flutter3DViewer` (méthode `_onModelLoaded`)
- Il n'y a **aucun `Timer` ni relance périodique** dans ce widget — l'animation tourne en boucle nativement dans le fichier GLB, aucune relance côté Flutter n'est nécessaire

## Bulle de conversation contextuelle

CrystaPh3y affiche une **bulle de conversation** au-dessus du modèle 3D, avec un message différent selon l'onglet actif de la navigation principale (bas de l'écran).

### Apparence de la bulle (`_SpeechBubble`)
- **Position** : empilée au-dessus du modèle 3D, dans une `Column` (`crossAxisAlignment: end`) — le modèle et la bulle partagent le même point d'ancrage `Positioned` (top/right)
- **Largeur max** : 200 px (`ConstrainedBox`)
- **Fond** : `AppColors.cardElevated`
- **Bordure** : `AppColors.border`
- **Coins arrondis** : `AppRadius.lg`
- **Glow** : `BoxShadow(color: AppColors.crystalGlow, blurRadius: 12, spreadRadius: -6)` — **cet effet est appliqué uniquement sur la bulle, pas sur le modèle 3D**
- **Texte** : `AppTextStyles.small`, aligné à droite (`TextAlign.right`)
- **Padding** : horizontal `AppSpacing.md`, vertical `AppSpacing.sm`

### Comportement par onglet
- **Accueil (0)** : « Entre ton ressenti du jour. »
- **Journal (1)** : « Relis ton parcours, un jour à la fois. »
- **Statistiques (2)** : « Observe tes tendances. »
- **Phénix (3)** : chaîne vide → aucune bulle affichée (écran déjà dédié au phénix)
- **Paramètres (4)** : « Tes réglages, à ton rythme. »

⚠️ **Ces textes sont des PLACEHOLDERS** — à remplacer par les textes définitifs de CrystaPh3y. Ils vivent dans la constante top-level `_messages` en haut de `crystaph3y_overlay.dart`, indexée par le numéro d'onglet (0 à 4). Quand `_messages[screenIndex]` est une chaîne vide, `_SpeechBubble` n'est simplement pas construit dans l'arbre.

## Fichiers impliqués

- **Widget** : `lib/shared/widgets/crystaph3y_overlay.dart`
  - `CrystaPh3yOverlay` (StatefulWidget) — paramètres `onModelLoaded` (optionnel) et `screenIndex` (requis)
  - `_SpeechBubble` (StatelessWidget privé) pour le rendu de la bulle

- **Intégration** : `lib/app/app.dart` (`_AppRootState.build()`)
  - `AppShell(onTabChanged: _onTabChanged)`
  - `CrystaPh3yOverlay(onModelLoaded: _onModelLoaded, screenIndex: _currentScreenIndex)`, dans un `Opacity`

- **Navigation** : `lib/app/app_shell.dart`
  - `_selectTab()` appelle `widget.onTabChanged?.call(index)` en plus du `setState` existant

- **Asset** : `assets/crystaph3y.glb`, déclaré dans `pubspec.yaml`

## Interaction utilisateur
- **Non interactive** — le modèle 3D est enveloppé dans un `AbsorbPointer`, et la bulle n'a aucun handler de tap
- Ne bloque pas les interactions des pages ni de la `NavigationBar`
