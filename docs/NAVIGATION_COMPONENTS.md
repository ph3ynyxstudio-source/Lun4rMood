# Navigation Components

## FR

Ce document sert d'index de navigation pour comprendre rapidement ou se trouvent les composants de l'application.
Il doit etre consulte avant de modifier une page, un widget ou une zone fonctionnelle.

### app/

`lun4rmood/lib/main.dart`
Utilite reelle : point d'entree Flutter qui lance l'application.
A modifier si : l'application doit lancer une autre racine globale.
A eviter si : on veut seulement modifier une page, un widget ou le style d'un ecran.

`lun4rmood/lib/app/app.dart`
Utilite reelle : racine MaterialApp de Lun4rMood et point d'assemblage visuel actuel.
A modifier si : on change le theme global, le titre de l'app ou la page affichee au lancement.
A eviter si : on veut seulement modifier le contenu interne d'une feature.

`lun4rmood/lib/app/router.dart`
Utilite reelle : emplacement reserve pour une future navigation.
A modifier si : une navigation explicite est demandee plus tard.
A eviter si : aucune navigation complete n'est encore demandee.

### features/

`lun4rmood/lib/features/check_in/check_in_page.dart`
Utilite reelle : page principale de saisie quotidienne du Check-in.
A modifier si : on change la structure generale du Check-in.
A eviter si : on veut seulement modifier un slider, un champ ou un bouton isole.

`lun4rmood/lib/features/check_in/widgets/check_in_slider.dart`
Utilite reelle : widget reutilisable pour les valeurs /10 du Check-in.
A modifier si : on change l'apparence ou le comportement commun des sliders.
A eviter si : on veut changer uniquement le texte ou l'ordre des sections de la page.

`lun4rmood/lib/features/check_in/widgets/check_in_note_field.dart`
Utilite reelle : champ de note courte du Check-in.
A modifier si : on change la saisie de note, la limite de lignes ou le texte d'aide.
A eviter si : on veut modifier les valeurs chiffrees du Check-in.

`lun4rmood/lib/features/check_in/widgets/save_check_in_button.dart`
Utilite reelle : bouton visuel d'enregistrement du Check-in.
A modifier si : on change le libelle ou l'action visible du bouton.
A eviter si : on veut ajouter du stockage reel sans decision technique explicite.

`lun4rmood/lib/features/journal/`
Utilite reelle : emplacement reserve pour la future feature journal.
A modifier si : une tache demande de creer le journal Flutter.
A eviter si : on travaille seulement sur le Check-in.

`lun4rmood/lib/features/statistics/`
Utilite reelle : emplacement reserve pour les futures statistiques.
A modifier si : une tache demande de creer les statistiques Flutter.
A eviter si : les donnees statistiques ne sont pas encore definies.

`lun4rmood/lib/features/phoenix/`
Utilite reelle : emplacement reserve pour le futur phoenix personnel.
A modifier si : une tache demande explicitement l'ecran ou la logique visuelle du phoenix.
A eviter si : on travaille seulement sur la saisie de donnees.

`lun4rmood/lib/features/settings/`
Utilite reelle : emplacement reserve pour les futurs reglages.
A modifier si : une tache demande un ecran de preferences ou d'export.
A eviter si : aucun parcours de reglages n'est demande.

### engine/

`lun4rmood/lib/engine/mood_engine.dart`
Utilite reelle : emplacement reserve pour la logique d'humeur.
A modifier si : une tache demande des calculs ou interpretations d'humeur.
A eviter si : on change seulement l'interface.

`lun4rmood/lib/engine/insight_engine.dart`
Utilite reelle : emplacement reserve pour la future logique d'insights.
A modifier si : une tache demande des observations ou syntheses automatisees.
A eviter si : aucune regle d'insight n'est definie.

`lun4rmood/lib/engine/phoenix_engine.dart`
Utilite reelle : emplacement reserve pour les regles d'evolution du phoenix.
A modifier si : une tache demande explicitement la progression de l'oeuf ou du phoenix.
A eviter si : on travaille sur un ecran sans logique d'evolution.

### data/

`lun4rmood/lib/data/local/`
Utilite reelle : emplacement reserve pour le futur stockage local.
A modifier si : une tache demande explicitement la persistence locale.
A eviter si : le besoin est seulement visuel ou sans sauvegarde.

`lun4rmood/lib/data/firebase/`
Utilite reelle : emplacement reserve pour une future sauvegarde Firebase optionnelle.
A modifier si : Firebase est explicitement demande plus tard.
A eviter si : Firebase n'est pas dans le perimetre de la tache.

`lun4rmood/lib/data/repositories/`
Utilite reelle : emplacement reserve pour les futurs repositories.
A modifier si : une tache demande de relier l'UI a une source de donnees.
A eviter si : aucun stockage ou source de donnees n'est demande.

### models/

`lun4rmood/lib/models/mood_entry.dart`
Utilite reelle : emplacement reserve pour le futur modele d'humeur.
A modifier si : une tache demande de definir les donnees d'humeur.
A eviter si : on cree seulement une interface sans modele persistant.

`lun4rmood/lib/models/journal_entry.dart`
Utilite reelle : emplacement reserve pour le futur modele d'entree de journal.
A modifier si : une tache demande de definir le journal.
A eviter si : le journal n'est pas dans le perimetre.

`lun4rmood/lib/models/phoenix_profile.dart`
Utilite reelle : emplacement reserve pour le futur profil phoenix.
A modifier si : une tache demande les donnees de l'oeuf ou du phoenix.
A eviter si : on ne travaille pas sur le phoenix.

`lun4rmood/lib/models/user_settings.dart`
Utilite reelle : emplacement reserve pour les futurs reglages utilisateur.
A modifier si : une tache demande des preferences persistantes.
A eviter si : aucun reglage utilisateur n'est demande.

### shared/

`lun4rmood/lib/shared/widgets/`
Utilite reelle : emplacement reserve pour les widgets reutilisables entre features.
A modifier si : un widget est vraiment partage par plusieurs zones.
A eviter si : le widget appartient clairement a une seule feature.

`lun4rmood/lib/shared/theme/`
Utilite reelle : emplacement reserve pour le theme visuel partage.
A modifier si : une tache demande un theme global.
A eviter si : on ajuste seulement un composant local.

`lun4rmood/lib/shared/utils/`
Utilite reelle : emplacement reserve pour les utilitaires reutilisables.
A modifier si : une fonction est utile dans plusieurs zones.
A eviter si : une logique locale suffit.

## EN

This document is a navigation index to quickly understand where application components live.
It should be checked before editing a page, widget, or functional area.

### app/

`lun4rmood/lib/main.dart`
Real purpose: Flutter entry point that launches the app.
Modify if: the app must launch another global root.
Avoid if: you only want to change a page, widget, or screen style.

`lun4rmood/lib/app/app.dart`
Real purpose: Lun4rMood MaterialApp root and current visual assembly point.
Modify if: the global theme, app title, or launch page changes.
Avoid if: you only want to edit the internal content of a feature.

`lun4rmood/lib/app/router.dart`
Real purpose: reserved place for future navigation.
Modify if: explicit navigation is requested later.
Avoid if: no complete navigation is requested yet.

### features/

`lun4rmood/lib/features/check_in/check_in_page.dart`
Real purpose: main daily Check-in input page.
Modify if: the overall Check-in structure changes.
Avoid if: you only want to modify an isolated slider, field, or button.

`lun4rmood/lib/features/check_in/widgets/check_in_slider.dart`
Real purpose: reusable widget for Check-in /10 values.
Modify if: the shared look or behavior of sliders changes.
Avoid if: you only want to change page text or section order.

`lun4rmood/lib/features/check_in/widgets/check_in_note_field.dart`
Real purpose: short note field for the Check-in.
Modify if: note input, line limits, or helper text changes.
Avoid if: you want to edit numeric Check-in values.

`lun4rmood/lib/features/check_in/widgets/save_check_in_button.dart`
Real purpose: visual save button for the Check-in.
Modify if: the label or visible action of the button changes.
Avoid if: you want to add real storage without an explicit technical decision.

`lun4rmood/lib/features/journal/`
Real purpose: reserved place for the future journal feature.
Modify if: a task asks to create the Flutter journal.
Avoid if: you are only working on Check-in.

`lun4rmood/lib/features/statistics/`
Real purpose: reserved place for future statistics.
Modify if: a task asks to create Flutter statistics.
Avoid if: statistical data is not defined yet.

`lun4rmood/lib/features/phoenix/`
Real purpose: reserved place for the future personal phoenix.
Modify if: a task explicitly asks for the phoenix screen or visual logic.
Avoid if: you are only working on data input.

`lun4rmood/lib/features/settings/`
Real purpose: reserved place for future settings.
Modify if: a task asks for preferences or export screens.
Avoid if: no settings flow is requested.

### engine/

`lun4rmood/lib/engine/mood_engine.dart`
Real purpose: reserved place for mood logic.
Modify if: a task asks for mood calculations or interpretation.
Avoid if: you are only changing the interface.

`lun4rmood/lib/engine/insight_engine.dart`
Real purpose: reserved place for future insight logic.
Modify if: a task asks for observations or automated summaries.
Avoid if: no insight rules are defined.

`lun4rmood/lib/engine/phoenix_engine.dart`
Real purpose: reserved place for phoenix evolution rules.
Modify if: a task explicitly asks for egg or phoenix progression.
Avoid if: you are working on a screen without evolution logic.

### data/

`lun4rmood/lib/data/local/`
Real purpose: reserved place for future local storage.
Modify if: a task explicitly asks for local persistence.
Avoid if: the need is only visual or has no saving.

`lun4rmood/lib/data/firebase/`
Real purpose: reserved place for future optional Firebase backup.
Modify if: Firebase is explicitly requested later.
Avoid if: Firebase is outside the task scope.

`lun4rmood/lib/data/repositories/`
Real purpose: reserved place for future repositories.
Modify if: a task asks to connect UI to a data source.
Avoid if: no storage or data source is requested.

### models/

`lun4rmood/lib/models/mood_entry.dart`
Real purpose: reserved place for the future mood model.
Modify if: a task asks to define mood data.
Avoid if: you are only creating an interface without a persistent model.

`lun4rmood/lib/models/journal_entry.dart`
Real purpose: reserved place for the future journal entry model.
Modify if: a task asks to define the journal.
Avoid if: the journal is outside scope.

`lun4rmood/lib/models/phoenix_profile.dart`
Real purpose: reserved place for the future phoenix profile.
Modify if: a task asks for egg or phoenix data.
Avoid if: you are not working on the phoenix.

`lun4rmood/lib/models/user_settings.dart`
Real purpose: reserved place for future user settings.
Modify if: a task asks for persistent preferences.
Avoid if: no user setting is requested.

### shared/

`lun4rmood/lib/shared/widgets/`
Real purpose: reserved place for widgets reused across features.
Modify if: a widget is truly shared by several areas.
Avoid if: the widget clearly belongs to one feature only.

`lun4rmood/lib/shared/theme/`
Real purpose: reserved place for shared visual theme.
Modify if: a task asks for a global theme.
Avoid if: you are only adjusting a local component.

`lun4rmood/lib/shared/utils/`
Real purpose: reserved place for reusable utilities.
Modify if: a function is useful in several areas.
Avoid if: local logic is enough.
