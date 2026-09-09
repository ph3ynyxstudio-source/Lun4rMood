# CrystaPh3y Overlay — Guide Visuel & Interaction

## Positionnement et apparence

Le cristal 3D CrystaPh3y apparaît en **overlay permanent** dans le coin **supérieur droit** de l'écran, sur toutes les pages du shell (Accueil, Journal, Statistiques, Phénix, Paramètres).

### Dimensions
- **Taille** : 80×80 pixels (ajustable 70-90 px si besoin après vérification visuelle)
- **Forme** : Circle (entouré d'une BoxShadow avec glow)

### Position
- **Top** : `MediaQuery.of(context).padding.top + 16` (safe area + 16 px d'espacement)
- **Right** : 16 px depuis le bord droit de l'écran

### Effets visuels
- **Glow** : `AppColors.crystalGlow` (violet translucide #408B68D3 avec blur 12 px, spread 2 px)
- **Model** : fichier GLB chargé depuis `assets/crystaph3y.glb`

### Animation
- Le cristal joue une animation de battement en boucle continue (relancée toutes les ~2 secondes)
- L'animation est gérée par le `Timer.periodic` qui redemarre la lecture tous les 2000 ms

## Fichiers impliqués

- **Widget** : `lib/shared/widgets/crystaph3y_overlay.dart`
  - Classe `CrystaPh3yOverlay` (StatefulWidget)
  - Variable `_loopTimer` gère la relance en boucle
  
- **Intégration** : `lib/app/app_shell.dart`
  - Ligne ~54 : le `body:` du Scaffold est devenu un `Stack` qui contient l'IndexedStack des pages + le widget `CrystaPh3yOverlay`

- **Asset** : `assets/crystaph3y.glb`
  - Déclaré dans `pubspec.yaml` ligne ~65

## Interaction utilisateur
- **Non interactive** — l'overlay 3D est purement décoratif
- L'animation continue en arrière-plan sans bloquer les touches/interactions des pages et de la NavigationBar
