# Retrait du logo LUN△RMOOD des écrans — Guide Visuel & Interaction

## Comportement

Le logo `LUN△RMOOD` (`AppLogoPageHeader`), auparavant affiché en haut de chaque écran via `AppPage`, est désormais **masqué par défaut sur tous les écrans du shell** : Accueil, Journal, Statistiques, Phénix, Paramètres, Check-in.

### Pourquoi
L'espace en haut de l'écran est désormais réservé à **CrystaPh3y** (overlay 3D + bulle de conversation contextuelle), qui occupe la même zone visuelle (coin supérieur droit). Garder le logo en plus créait une redondance/superposition d'éléments dans cette zone.

### Comportement par défaut (nouveau)
- `AppPage(showLogo: ...)` a désormais `false` comme valeur par défaut
- Aucun écran du projet ne passait explicitement `showLogo: true` — le changement de valeur par défaut suffit donc à masquer le logo partout, sans toucher aux appels existants

### Réactivation possible
- Le paramètre `showLogo` et le widget `AppLogoPageHeader` ne sont **pas supprimés** — un écran spécifique pourra réafficher le logo plus tard via `AppPage(showLogo: true, ...)` si besoin

## Fichiers impliqués

- **`lib/shared/widgets/app_page.dart`**
  - `showLogo` : valeur par défaut passée de `true` à `false`
  - Logique `if (showLogo) const AppLogoPageHeader()` inchangée
