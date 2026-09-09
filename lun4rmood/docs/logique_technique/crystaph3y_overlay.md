# CrystaPh3y Overlay — Logique Technique

## Architecture

Le widget `CrystaPh3yOverlay` est un `StatefulWidget` qui encapsule le rendu 3D via `Flutter3DController` du package `flutter_3d_controller`.

### Composants clés

1. **Flutter3DController** (`_controller`)
   - Créé dans `initState()`
   - Gère le chargement du modèle GLB et la lecture des animations via `playAnimation()`
   - Ne nécessite pas d'appel `dispose()` (pas de ressources à libérer)

2. **Flutter3DViewer**
   - Affiche le modèle 3D chargé depuis `assets/crystaph3y.glb`
   - Initialise automatiquement le controller via son `onWebViewCreated` callback (interne)

3. **Timer.periodic** (`_loopTimer`)
   - Redémarre l'animation du battement toutes les 2000 ms (2 secondes)
   - Lancé dans `_startAnimationLoop()` (appelée dans `initState()`)
   - **Pourquoi ce choix** : `flutter_3d_controller` n'expose pas de callback "fin d'animation" fiable, donc `Timer.periodic` est la solution la plus simple et prévisible
   - Annulé dans `dispose()` pour éviter les fuites mémoire
   - Vérifie `mounted` avant chaque appel à `playAnimation()` pour sécurité

## Flux de données

```
initState()
  → _controller = Flutter3DController()
  → _startAnimationLoop() lancé
    → _controller.playAnimation() [première lecture]
    → _loopTimer = Timer.periodic(2s)
      → relit l'animation tous les 2s (si mounted == true)

build()
  → Flutter3DViewer(src: 'assets/crystaph3y.glb', controller: _controller)
  → WebView interne charge et initialise le modèle GLB

[Utilisateur quitte le widget]
  → dispose()
  → _loopTimer?.cancel() [arrête le timer]
  → State est destroyed
```

## Paramètres critiques

- **Intervalle de boucle** : 2000 ms (2 secondes)
  - À ajuster si la durée réelle de l'animation de battement est différente
  - Si l'animation est trop courte ou longue, il y aura un blanc visible ou une relance qui chevauche

- **Taille du widget** : 80×80 px
  - Doit correspondre au ratio du modèle GLB pour éviter distortion
  - Ajustable à 70-90 px si le rendu à l'écran semble trop grand/petit

## Considérations de performance

- **GPU** : Le rendu 3D GLB utilise l'accélération matérielle (déjà activée dans AndroidManifest via `android:hardwareAccelerated="true"`)
- **Mémoire** : Le Timer.periodic ne consomme que ~quelques µs d'overhead toutes les 2s (négligeable)
- **Multithreading** : `flutter_3d_controller` gère le rendu GL de manière thread-safe ; pas de risque de deadlock

## Dépendances

- `flutter_3d_controller: ^1.0.2` (ajouté à `pubspec.yaml`)
- Déclaration d'asset : `assets/crystaph3y.glb` (ajoutée à `pubspec.yaml`)
- Configuration Android : `android:usesCleartextTraffic="true"` (ajoutée à AndroidManifest.xml, au cas où le chargement du GLB nécessite une requête HTTP)

## Future améliorations possibles

- Paramétrer l'intervalle de boucle via une constante au lieu de la valeur codée en dur (2000 ms)
- Ajouter un contrôle de play/pause (ex. pause quand l'app est en background via `AppLifecycleListener`)
- Détecter la durée réelle de l'animation et l'utiliser pour calculer l'intervalle automatiquement (complexe, car `Flutter3DController` n'expose pas ce metadata)
