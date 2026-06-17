# Product Decisions

## FR

### Decision : Flutter devient la base principale avant publication officielle

Lun4rMood utilise Flutter comme nouvelle base principale.
Le MVP React/PWA reste une validation de concept et ne sera pas migre maintenant.

### Decision : Local First par defaut

Les donnees utilisateur doivent etre locales par defaut.
Le projet doit proteger les donnees personnelles et eviter de dependre d'un service distant pour les fonctions de base.

### Decision : export visible obligatoire

L'utilisateur doit pouvoir exporter ses donnees de maniere visible et simple.
L'export fait partie de la confiance produit, surtout pour des donnees personnelles.

### Decision : Firebase sera optionnel plus tard

Firebase pourra etre etudie plus tard pour des fonctions optionnelles.
Il ne doit pas etre ajoute au demarrage du MVP Flutter.
Firebase ne doit pas remplacer le stockage local.

### Decision : compte recommande mais non obligatoire

L'application doit pouvoir etre utilisee sans compte obligatoire.
Un compte pourra etre recommande plus tard pour la sauvegarde ou la synchronisation, mais il ne doit pas bloquer l'usage de base.

### Decision : l'oeuf personnel sera integre des le MVP Flutter

L'oeuf personnel fait partie du MVP Flutter.
Il doit representer une evolution personnelle dans l'application, pas une simple decoration.
L'utilisateur commence avec un oeuf, le nomme et choisit un theme visuel de depart.

### Decision : le phenix represente le parcours, pas la performance

Le phenix est lie au parcours de l'utilisateur.
Il ne doit pas devenir un score de performance, une pression quotidienne ou un systeme de jugement.
Il represente l'observation, la comprehension de soi et l'evolution personnelle.

## EN

### Decision: Flutter becomes the main base before official release

Lun4rMood uses Flutter as the new main base.
The React/PWA MVP remains a proof of concept and will not be migrated now.

### Decision: Local First by default

User data should be local by default.
The project should protect personal data and avoid depending on a remote service for core features.

### Decision: visible export is required

The user should be able to export their data in a visible and simple way.
Export is part of product trust, especially for personal data.

### Decision: Firebase will be optional later

Firebase may be reviewed later for optional features.
It should not be added at the start of the Flutter MVP.
Firebase should not replace local storage.

### Decision: account recommended but not mandatory

The app should remain usable without a mandatory account.
An account may be recommended later for backup or sync, but it should not block core usage.

### Decision: the personal egg will be included in the Flutter MVP

The personal egg is part of the Flutter MVP.
It should represent personal evolution inside the app, not simple decoration.
The user starts with an egg, names it, and chooses an initial visual theme.

### Decision: the phoenix represents the journey, not performance

The phoenix is connected to the user's journey.
It should not become a performance score, daily pressure, or judgment system.
It represents observation, self-understanding, and personal evolution.
