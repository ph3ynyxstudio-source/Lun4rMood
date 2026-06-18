# README IA / AI README

## FR

### Role

Ce document explique aux futurs agents IA comment travailler dans le repo Lun4rMood.
Il doit aider a garder le projet simple, lisible et coherent dans le temps.

### Avant de modifier le projet

- Lire `docs/INDEX.md`.
- Consulter `docs/NAVIGATION_COMPONENTS.md` avant de modifier une page ou un composant.
- Respecter les decisions produit dans `docs/PRODUCT_DECISIONS.md`.
- Respecter l'architecture dans `docs/ARCHITECTURE_FLUTTER.md`.
- Verifier le code existant avant de proposer une nouvelle structure.

### Regles de modification

- Ne pas modifier, deplacer, supprimer ou renommer des fichiers sans demande explicite.
- Ne pas ajouter Riverpod, Hive, Firebase ou go_router sans demande explicite.
- Ne pas migrer du code React sans demande explicite.
- Ne pas remplacer une intention produit documentee par une preference personnelle.
- Garder les changements limites au perimetre demande.

### Code Flutter

- Creer des composants petits et comprehensibles.
- Eviter les pages geantes et les fichiers difficiles a modifier a la main.
- Separer les sections visuelles en widgets nommes clairement.
- Privilegier la lisibilite avant l'optimisation prematuree.
- Utiliser les tokens de theme dans `lun4rmood/lib/shared/theme/` au lieu d'ecrire des couleurs, espacements, rayons ou styles en dur dans les pages.
- Ne pas ajouter de stockage reel tant que la tache ne le demande pas.

### Verification et fin de tache

- Executer `flutter analyze` si Flutter est disponible dans le shell.
- Verifier que l'application demarre encore quand c'est possible.
- Expliquer les changements faits a la fin.
- Lister les elements volontairement non faits si cela aide a comprendre le perimetre.
- Proposer un message de commit bilingue FR/EN.

## EN

### Role

This document explains how future AI agents should work in the Lun4rMood repo.
It helps keep the project simple, readable, and consistent over time.

### Before modifying the project

- Read `docs/INDEX.md`.
- Check `docs/NAVIGATION_COMPONENTS.md` before editing a page or component.
- Respect the product decisions in `docs/PRODUCT_DECISIONS.md`.
- Respect the architecture in `docs/ARCHITECTURE_FLUTTER.md`.
- Check the existing code before proposing a new structure.

### Change rules

- Do not modify, move, delete, or rename files without an explicit request.
- Do not add Riverpod, Hive, Firebase, or go_router without an explicit request.
- Do not migrate React code without an explicit request.
- Do not replace a documented product intent with a personal preference.
- Keep changes limited to the requested scope.

### Flutter code

- Create small and understandable components.
- Avoid huge pages and files that are hard to edit manually.
- Split visual sections into clearly named widgets.
- Prefer readability before premature optimization.
- Use theme tokens in `lun4rmood/lib/shared/theme/` instead of hardcoding colors, spacing, radius, or text styles in pages.
- Do not add real storage unless the task asks for it.

### Verification and task wrap-up

- Run `flutter analyze` if Flutter is available in the shell.
- Check that the app still starts when possible.
- Explain the changes made at the end.
- List intentionally skipped items when it helps clarify the scope.
- Suggest a bilingual FR/EN commit message.
