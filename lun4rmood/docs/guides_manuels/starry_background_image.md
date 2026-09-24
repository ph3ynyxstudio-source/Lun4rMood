# Fond d'image personnalisé — Guide Visuel & Interaction

## Apparence

`StarryBackground` (et `AppPage` qui l'enveloppe) supportent désormais un fond d'**image** en plus du gradient étoilé par défaut.

### Comportement par défaut (sans changement)
- Si aucune image n'est fournie, l'écran garde le **gradient `AppGradients.background`** existant, avec les étoiles peintes par-dessus (`CustomPaint`)
- Aucun écran existant n'est affecté tant qu'il ne passe pas explicitement `backgroundImage`

### Avec une image de fond
- Si `backgroundImage` est fourni (ex. `'assets/images/fond-nuage.webp'`), il remplace le gradient
- L'image est affichée en plein cadre avec `BoxFit.cover` (recouvre tout l'espace disponible, recadrée si besoin)
- Les étoiles (`CustomPaint`) continuent d'être peintes par-dessus l'image, comme au-dessus du gradient

### Écran concerné
- **Accueil** (`HomePage`) utilise `AppPage(backgroundImage: 'assets/images/fond-nuage.webp', ...)` — fond nuageux au lieu du gradient étoilé
- Tous les autres écrans (Journal, Statistiques, Phénix, Paramètres) ne passent pas ce paramètre et gardent le gradient d'origine

## Fichiers impliqués

- **`lib/shared/widgets/starry_background.dart`**
  - `StarryBackground` reçoit un paramètre optionnel `backgroundImage: String?`
  - Le `BoxDecoration` du `DecoratedBox` utilise soit `gradient` (si `backgroundImage == null`), soit `image` (sinon)

- **`lib/shared/widgets/app_page.dart`**
  - `AppPage` reçoit le même paramètre optionnel `backgroundImage: String?` et le transmet tel quel à `StarryBackground`

- **`lib/features/home/home_page.dart`**
  - `HomePage.build()` passe `backgroundImage: 'assets/images/fond-nuage.webp'` à `AppPage`

- **Asset** : `assets/images/fond-nuage.webp`, déjà déclaré dans `pubspec.yaml`
