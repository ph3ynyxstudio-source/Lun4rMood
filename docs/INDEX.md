# Lun4rMood Documentation Index

## FR

### Role du document

Ce document est le point d'entree de la documentation du projet Lun4rMood.
Il sert a retrouver rapidement les documents importants et a comprendre l'etat actuel du projet.
Il doit etre consulte avant les changements importants sur la base Flutter.

### Documents

- [Architecture Flutter](./ARCHITECTURE_FLUTTER.md)
- [Navigation des composants](./NAVIGATION_COMPONENTS.md)
- [Migration React vers Flutter](./MIGRATION_REACT_TO_FLUTTER.md)
- [Decisions produit](./PRODUCT_DECISIONS.md)

### Etat actuel du projet

- Lun4rMood est maintenant base sur un nouveau projet Flutter.
- L'application affiche maintenant un shell visuel Flutter avec navigation inferieure.
- Des tokens de theme centralises existent dans `lun4rmood/lib/shared/theme/`.
- La page Check-in est integree au shell de navigation.
- L'ancien MVP React/PWA reste un prototype avance, une validation de concept et une base d'apprentissage.
- Aucune migration de code React n'est faite pour l'instant.
- Aucune dependance de gestion d'etat, de stockage local ou de cloud n'est ajoutee a cette etape.

### Prochaines etapes

- Completer progressivement les ecrans du MVP Flutter.
- Integrer l'oeuf personnel comme element central du MVP Flutter.
- Preparer un export visible et simple des donnees utilisateur.
- Garder une approche Local First pour les donnees utilisateur.
- Reporter Firebase a une phase optionnelle ulterieure.
- Garder le compte utilisateur recommande, mais non obligatoire.

## EN

### Document role

This document is the entry point for the Lun4rMood project documentation.
It helps locate the main documents and understand the current state of the project.
It should be checked before important changes to the Flutter base.

### Documents

- [Flutter Architecture](./ARCHITECTURE_FLUTTER.md)
- [Components Navigation](./NAVIGATION_COMPONENTS.md)
- [React to Flutter Migration](./MIGRATION_REACT_TO_FLUTTER.md)
- [Product Decisions](./PRODUCT_DECISIONS.md)

### Current project state

- Lun4rMood is now based on a new Flutter project.
- The app now shows a Flutter visual shell with bottom navigation.
- Centralized theme tokens exist in `lun4rmood/lib/shared/theme/`.
- The Check-in page is integrated into the navigation shell.
- The previous React/PWA MVP remains an advanced prototype, a proof of concept, and a learning base.
- No React code migration is being done at this stage.
- No state management, local storage, or cloud dependency is added at this stage.

### Next steps

- Complete the Flutter MVP screens step by step.
- Integrate the personal egg as a central MVP element.
- Prepare a visible and simple export for user data.
- Keep a Local First approach for user data.
- Keep Firebase for a later optional phase.
- Keep the user account recommended, but not mandatory.
