# Maquette de reference Lun4rMood Flutter v1

## FR

### Role du document

Ce document decrit la nouvelle maquette cible fournie dans la conversation comme reference visuelle principale pour l'interface Flutter v1.

La maquette precedente `docs/maquette_theme.png` reste une reference de design tokens.
La reference d'ecran principale est maintenant cette maquette `Dashboard - Accueil`.

### Priorite visuelle

1. Cette maquette `Dashboard - Accueil` pour la composition des ecrans.
2. `docs/maquette_theme.png` pour les tokens visuels generaux.
3. Documentation projet.
4. Code existant.

### Direction generale

- Application mobile sombre, lunaire et introspective.
- Fond principal noir bleu tres sombre.
- Etoiles blanches discretes, statiques.
- Pas de nebuleuse animee en fond.
- Cartes sombres avec bordures discretes.
- Accents cyan, magenta et violet.
- UI calme, immersive, lisible, non gamifiee.

### Palette cible

- Fond principal : `#080B24`
- Carte / surface : `#12142E`
- Surface elevee : `#181A36`
- Primaire cyan : `#00F0FF`
- Secondaire magenta : `#FF40FF`
- Accent violet : `#8A2BE2`
- Texte principal : `#EAEAFF`
- Texte secondaire : `#A9ADC6`
- Etoiles : `#FFFFFF` avec opacite faible, environ 10-20 %

### Dashboard Accueil

Le dashboard est la cible de l'ecran principal futur.
La navigation actuelle ne doit pas etre modifiee sans demande explicite.

Elements visibles :

- logo `LUN△RMOOD` en haut ;
- message d'accueil `BONJOUR` ;
- date courte sous le message d'accueil ;
- grande section lunaire principale, environ 35-40 % de l'ecran ;
- asset lune au centre ;
- libelle `PHASE ACTUELLE` ;
- nom de phase, par exemple `Premier Croissant` ;
- jour du cycle ;
- bloc `CHECK-IN` integre comme capture rapide principale ;
- carte `RESUME DU JOUR` avec trois indicateurs rapides ;
- bulle flottante `CRYSTAPH3Y` discrete ;
- navigation principale fixe en bas.

### Check-in

Le Check-in reste une capture rapide.
Il doit contenir :

- titre `Check-in` ;
- date ;
- sliders Emotion, Energie, Stress, Consommation ;
- note optionnelle ;
- bouton principal `Enregistrer`.

Le Check-in est progressivement integre au dashboard principal.
Ne pas ajouter de stockage tant que ce n'est pas demande.

### Journal

Le Journal est l'historique.
Il doit preparer :

- navigation par jours ;
- entrees emotion, energie, consommation ;
- note de jour ;
- navigation principale en bas.

### Statistiques

Les Statistiques montrent des graphiques simples.
La maquette cible contient :

- filtre `7 derniers jours` ;
- courbe Emotion ;
- courbe Energie ;
- courbe Consommation ;
- navigation principale en bas.

### Phenix

Le Phenix est une zone d'analyses et d'insights.
La maquette cible contient :

- cartes Observations ;
- cartes Patterns ;
- cartes Reflexions ;
- cartes Insights.

Le phenix represente le parcours, pas la performance.

### CRYSTAPH3Y

`CRYSTAPH3Y` est une bulle contextuelle flottante discrete.

Usage cible :

- messages courts ;
- contexte de progression ;
- aide douce ;
- pas de gamification agressive.

### Navigation cible

La maquette montre 5 onglets fixes :

- Accueil ;
- Journal ;
- Statistiques ;
- Phenix ;
- Parametres.

Note importante : le projet actuel peut conserver temporairement plus d'onglets.
Ne pas modifier la navigation principale sans demande explicite.

### Non inclus dans cette v1

- Splash anime final ;
- Sun View ;
- animation du phenix ;
- gamification ;
- mode clair ;
- oeuf evolutif ;
- correlations avancees.

## EN

### Document role

This document describes the new target mockup provided in the conversation as the main visual reference for the Flutter v1 interface.

The previous `docs/maquette_theme.png` remains a design-token reference.
The main screen reference is now this `Dashboard - Home` mockup.

### Visual direction

- Very dark lunar mobile app.
- Subtle static white stars.
- No animated background nebula.
- Dark cards with quiet borders.
- Cyan, magenta, and violet accents.
- Calm, immersive, readable, non-gamified UI.

### Target palette

- Main background: `#080B24`
- Card / surface: `#12142E`
- Elevated surface: `#181A36`
- Primary cyan: `#00F0FF`
- Secondary magenta: `#FF40FF`
- Violet accent: `#8A2BE2`
- Main text: `#EAEAFF`
- Secondary text: `#A9ADC6`
- Stars: `#FFFFFF` at low opacity, around 10-20 %
