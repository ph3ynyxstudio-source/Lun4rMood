# Fond d'image personnalisé — Logique Technique

## Composants modifiés

- **`lib/shared/widgets/starry_background.dart`**
  - `StarryBackground` reçoit un nouveau paramètre optionnel `final String? backgroundImage;` (défaut `null`)
  - Dans `build()`, le `BoxDecoration` du `DecoratedBox` racine devient conditionnel :
    - `gradient: backgroundImage == null ? AppGradients.background : null`
    - `image: backgroundImage != null ? DecorationImage(image: AssetImage(backgroundImage!), fit: BoxFit.cover) : null`
  - Le `CustomPaint` (étoiles) et son `child` restent inchangés — les étoiles sont toujours peintes par-dessus, que ce soit sur le gradient ou sur l'image

- **`lib/shared/widgets/app_page.dart`**
  - `AppPage` reçoit le même paramètre optionnel `final String? backgroundImage;`
  - Transmis tel quel à `StarryBackground(backgroundImage: backgroundImage, ...)`

- **`lib/features/home/home_page.dart`**
  - L'appel `AppPage(...)` existant reçoit `backgroundImage: 'assets/images/fond-nuage.webp'`

## Flux

```
HomePage.build()
  → AppPage(backgroundImage: 'assets/images/fond-nuage.webp', children: [...])

AppPage.build()
  → StarryBackground(backgroundImage: 'assets/images/fond-nuage.webp', child: ...)

StarryBackground.build()
  → backgroundImage != null
    → BoxDecoration(image: DecorationImage(AssetImage(backgroundImage!), fit: cover))
  → CustomPaint(painter: _StarryBackgroundPainter, child: child)
```

Pour tout autre écran qui construit `AppPage(...)` sans `backgroundImage` :

```
AppPage.build()
  → StarryBackground(backgroundImage: null, child: ...)

StarryBackground.build()
  → backgroundImage == null
    → BoxDecoration(gradient: AppGradients.background)   [comportement inchangé]
```

## Points d'attention

- `BoxDecoration` ne peut pas avoir `gradient` et `image` non-nuls sans que l'image ne soit peinte par-dessus le gradient ; ici les deux champs sont mutuellement exclusifs (l'un est toujours `null` selon l'état de `backgroundImage`), donc pas de conflit de rendu.
- Le paramètre est optionnel avec défaut `null` à chaque niveau (`StarryBackground` et `AppPage`) : aucun appel existant à ces widgets n'a besoin d'être modifié pour continuer à fonctionner à l'identique.
- Aucune vérification d'existence de l'asset n'est faite au niveau du widget — si `backgroundImage` pointe vers un chemin non déclaré dans `pubspec.yaml`, `AssetImage` lèvera une erreur de chargement standard Flutter à l'exécution.
