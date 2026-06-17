# React to Flutter Migration

## FR

### Role du MVP React/PWA

L'ancien MVP React/PWA sert de validation de concept pour Lun4rMood.
Il peut aider a comprendre les idees produit, les parcours utiles et certaines logiques deja testees.
Il a notamment valide le journal quotidien, le check-in emotionnel, les statistiques, les phases lunaires et les premieres bases UX.

Il ne doit pas etre traite comme une base technique a copier directement dans Flutter.

### Pourquoi Flutter devient la base principale

Flutter devient la base principale parce qu'il correspond mieux a la direction actuelle du projet :

- meilleure experience mobile ;
- meilleure coherence avec Android et Google Play ;
- meilleure base pour une application installee ;
- meilleure separation entre interface, donnees, moteur logique et affichage ;
- meilleure fondation pour le futur systeme de phoenix personnel.

### Risques lies au stockage navigateur/PWA

Le MVP React/PWA dependait de mecanismes de stockage lies au navigateur.
Ces donnees peuvent etre perdues si l'utilisateur supprime les donnees du navigateur, du site, du cache ou de l'historique.

Comme Lun4rMood touche a des donnees personnelles et emotionnelles, une version officielle ne doit pas dependre uniquement de ce type de stockage.

### Elements qui pourront etre migres plus tard

Les elements suivants pourront etre analyses et adaptes plus tard :

- journal ;
- check-in emotionnel ;
- statistiques ;
- consommation sur echelle /10 ;
- phases lunaires ;
- logique d'insights ;
- export.

La migration devra se faire par intention produit, pas par copie directe de code.

### Ce qui ne doit pas etre copie directement

- La structure React.
- Les dependances React.
- Les composants React.
- La logique liee au navigateur.
- Le stockage fragile base seulement sur `localStorage` ou `IndexedDB`.
- Les choix de routage web s'ils ne correspondent pas a Flutter.
- Les styles CSS tels quels.
- Les solutions temporaires du MVP qui ne correspondent plus a la nouvelle base.

## EN

### Role of the React/PWA MVP

The previous React/PWA MVP is a proof of concept for Lun4rMood.
It can help understand product ideas, useful flows, and some logic that was already tested.
It notably validated the daily journal, emotional check-in, statistics, moon phases, and first UX foundations.

It should not be treated as a technical base to copy directly into Flutter.

### Why Flutter becomes the main base

Flutter becomes the main base because it better matches the current direction of the project:

- better mobile experience;
- better fit with Android and Google Play;
- stronger base for an installed app;
- clearer separation between interface, data, logic engine, and display;
- stronger foundation for the future personal phoenix system.

### Risks related to browser/PWA storage

The React/PWA MVP depended on browser-related storage mechanisms.
This data can be lost if the user clears browser data, site data, cache, or history.

Because Lun4rMood handles personal and emotional data, an official version should not depend only on this type of storage.

### Elements that may be migrated later

The following elements may be reviewed and adapted later:

- journal;
- emotional check-in;
- statistics;
- consumption on a /10 scale;
- moon phases;
- insight logic;
- export.

Migration should follow product intent, not direct code copying.

### What should not be copied directly

- The React structure.
- React dependencies.
- React components.
- Browser-specific logic.
- Fragile storage based only on `localStorage` or `IndexedDB`.
- Web routing choices if they do not fit Flutter.
- CSS styles as-is.
- Temporary MVP solutions that no longer fit the new base.
