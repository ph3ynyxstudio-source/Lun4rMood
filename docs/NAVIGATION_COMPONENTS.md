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
Utilite reelle : racine MaterialApp de Lun4rMood, connectee au theme global et au shell.
A modifier si : on change le ThemeData global, le titre de l'app ou la racine affichee.
A eviter si : on veut seulement modifier le contenu interne d'une feature.

`lun4rmood/lib/app/app_shell.dart`
Utilite reelle : shell de navigation a cinq onglets entre les ecrans principaux du MVP; le Check-in passe par la capture rapide du Dashboard.
A modifier si : on change les onglets, leur ordre, leurs icones ou la page affichee par onglet.
A eviter si : on veut seulement modifier le contenu d'une page.

`lun4rmood/lib/app/router.dart`
Utilite reelle : constantes de routes manuelles reservees aux vues isolees ou a une future navigation.
A modifier si : une route nommee doit etre exposee sans changer la navigation principale.
A eviter si : aucune route explicite n'est demandee.

### features/

`lun4rmood/lib/features/home/home_page.dart`
Utilite reelle : dashboard Accueil du shell MVP, base sur la maquette Flutter v1.
A modifier si : on change la section lunaire, le Check-in integre, le resume du jour ou la bulle CRYSTAPH3Y.
A eviter si : on veut changer la barre de navigation.

`lun4rmood/lib/features/intro/splash_intro_view.dart`
Utilite reelle : vue SplashIntroView isolee pour preparer l'introduction lunaire et phenix.
A modifier si : une tache demande de faire evoluer l'intro, la lune, le bouton Entrer ou la future animation.
A eviter si : on veut changer le demarrage actuel de l'application sans decision explicite.

`lun4rmood/lib/features/check_in/check_in_page.dart`
Utilite reelle : vue complete de saisie quotidienne conservee hors navigation principale; ses widgets alimentent la capture rapide du Dashboard.
A modifier si : on change la structure generale du Check-in.
A eviter si : on veut seulement modifier un slider, un champ ou un bouton isole.

`lun4rmood/lib/features/check_in/widgets/check_in_slider.dart`
Utilite reelle : widget reutilisable pour les valeurs /10 du Check-in.
A modifier si : on change l'apparence ou le comportement commun des sliders.
A eviter si : on veut changer uniquement le texte ou l'ordre des sections de la page.

`lun4rmood/lib/features/check_in/widgets/check_in_quick_entry.dart`
Utilite reelle : capture rapide du Dashboard qui cree ou met a jour la `UserDailyEntry` du jour via repository.
A modifier si : on change le formulaire embarque ou le mapping vers les donnees utilisateur brutes.
A eviter si : on veut seulement changer la navigation principale.

`lun4rmood/lib/features/check_in/widgets/check_in_note_field.dart`
Utilite reelle : champ de note courte du Check-in.
A modifier si : on change la saisie de note, la limite de lignes ou le texte d'aide.
A eviter si : on veut modifier les valeurs chiffrees du Check-in.

`lun4rmood/lib/features/check_in/widgets/save_check_in_button.dart`
Utilite reelle : bouton visuel d'enregistrement du Check-in.
A modifier si : on change le libelle ou l'action visible du bouton.
A eviter si : on veut ajouter du stockage reel sans decision technique explicite.

`lun4rmood/lib/features/journal/journal_page.dart`
Utilite reelle : ligne du temps quotidienne qui observe les `UserDailyEntry` du repository.
A modifier si : on change la navigation entre les jours ou la presentation d'une entree Journal.
A eviter si : on veut ajouter une persistence sans decision technique explicite.

`lun4rmood/lib/features/journal/widgets/journal_timeline.dart`
Utilite reelle : liste horizontale swipeable des jours et gestion visuelle de la selection.
A modifier si : on change le nombre, le format ou l'apparence des jours visibles.
A eviter si : on change seulement le contenu du resume quotidien.

`lun4rmood/lib/features/journal/widgets/journal_day_summary.dart`
Utilite reelle : carte de resume d'une entree Journal ou etat vide de la journee.
A modifier si : on change les metriques, les notes ou l'etat vide affiches.
A eviter si : on change seulement la navigation temporelle.

`lun4rmood/lib/features/statistics/statistics_page.dart`
Utilite reelle : page Statistiques placeholder pour les futures tendances.
A modifier si : une tache demande de faire evoluer l'ecran Statistiques.
A eviter si : les donnees statistiques ne sont pas encore definies.

`lun4rmood/lib/features/phoenix/phoenix_page.dart`
Utilite reelle : page Phenix placeholder avec representation visuelle simple de l'oeuf.
A modifier si : une tache demande explicitement l'ecran ou la logique visuelle du phenix.
A eviter si : on travaille seulement sur la saisie de donnees.

`lun4rmood/lib/features/settings/settings_page.dart`
Utilite reelle : page Parametres placeholder pour donnees locales, export, compte et apparence.
A modifier si : une tache demande un ecran de preferences, d'export ou de controle local.
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
Utilite reelle : adaptateurs locaux; contient actuellement le repository en memoire non persistant.
A modifier si : on change l'implementation locale derriere un contrat repository.
A eviter si : on veut ajouter Firebase ou contourner les repositories.

`lun4rmood/lib/data/firebase/`
Utilite reelle : emplacement reserve pour une future sauvegarde Firebase optionnelle.
A modifier si : Firebase est explicitement demande plus tard.
A eviter si : Firebase n'est pas dans le perimetre de la tache.

`lun4rmood/lib/data/repositories/`
Utilite reelle : contrats d'acces aux donnees independants du futur moteur de stockage.
A modifier si : les operations de lecture, observation ou sauvegarde evoluent.
A eviter si : on change seulement une implementation locale.

`lun4rmood/lib/data/models/user/user_daily_entry.dart`
Utilite reelle : source de verite des donnees quotidiennes brutes creees par l'utilisateur.
A modifier si : le schema canonique Capture rapide / Journal / Statistiques evolue.
A eviter si : on ajoute une donnee calculee ou technique.

`lun4rmood/lib/data/models/derived/daily_summary.dart`
Utilite reelle : donnees derivees localement, separees des entrees utilisateur brutes.
A modifier si : le contrat des resumes, tendances, tags ou indicateurs evolue.
A eviter si : on change la saisie utilisateur.

`lun4rmood/lib/data/models/settings/user_settings.dart`
Utilite reelle : theme et preferences UI/application, sans consentements.
A modifier si : les preferences utilisateur evoluent.
A eviter si : on ajoute une decision de confidentialite.

`lun4rmood/lib/data/models/privacy/consent_settings.dart`
Utilite reelle : consentements explicites cloud, analytics, recherche et fonctions IA, desactives par defaut.
A modifier si : la gouvernance des consentements evolue.
A eviter si : on change seulement une preference visuelle.

`lun4rmood/lib/data/privacy/user_daily_entry_privacy_mapper.dart`
Utilite reelle : projection sans note courte ni note Journal pour les futurs exports consentis.
A modifier si : les regles d'exclusion de donnees evoluent.
A eviter si : on veut envoyer des donnees ou pretendre garantir une anonymisation complete.

### shared/

`lun4rmood/lib/shared/widgets/app_page.dart`
Utilite reelle : structure de page commune avec logo haut centre, fond sombre etoile, zone sure et scroll.
A modifier si : on change le cadre commun des pages principales.
A eviter si : une seule page a besoin d'un ajustement local.

`lun4rmood/lib/shared/widgets/app_logo_header.dart`
Utilite reelle : logo Lun4rMood centre reutilisable pour les pages principales.
A modifier si : on change l'asset, la taille ou l'espacement du logo global.
A eviter si : un ecran isole a besoin d'un logo specifique.

`lun4rmood/lib/shared/widgets/starry_background.dart`
Utilite reelle : fond noir etoile subtil reutilisable derriere les pages.
A modifier si : on change la densite, l'opacite ou le placement global des etoiles.
A eviter si : un fond local doit rester different pour une animation specifique.

`lun4rmood/lib/shared/widgets/app_card.dart`
Utilite reelle : carte visuelle commune pour les contenus encadres.
A modifier si : on change l'apparence commune des cartes.
A eviter si : le besoin concerne une carte tres specifique a une feature.

`lun4rmood/lib/shared/widgets/`
Utilite reelle : emplacement reserve pour les widgets reutilisables entre features.
A modifier si : un widget est vraiment partage par plusieurs zones.
A eviter si : le widget appartient clairement a une seule feature.

`lun4rmood/lib/shared/theme/app_colors.dart`
Utilite reelle : palette de couleurs centrale de Lun4rMood.
A modifier si : une decision demande de changer la palette globale.
A eviter si : on veut seulement tester une couleur locale dans une page.

`lun4rmood/lib/shared/theme/app_gradients.dart`
Utilite reelle : gradients centraux PH3YNYX pour fonds, accents et composants.
A modifier si : une decision demande de changer les gradients globaux.
A eviter si : un gradient est strictement specifique a un prototype isole.

`lun4rmood/lib/shared/theme/app_shadows.dart`
Utilite reelle : ombres et glows centraux pour cartes, lune et accents.
A modifier si : une decision demande de changer l'intensite globale des glows.
A eviter si : une ombre locale est liee a une animation ou un etat specifique.

`lun4rmood/lib/shared/theme/app_spacing.dart`
Utilite reelle : constantes d'espacement communes.
A modifier si : l'echelle d'espacement globale change.
A eviter si : une page a seulement besoin d'un arrangement local.

`lun4rmood/lib/shared/theme/app_radius.dart`
Utilite reelle : constantes de rayons communs.
A modifier si : le style global des coins change.
A eviter si : un composant isole a une contrainte specifique.

`lun4rmood/lib/shared/theme/app_text_styles.dart`
Utilite reelle : styles de texte communs.
A modifier si : la typographie globale change.
A eviter si : on veut seulement changer une phrase ou un libelle.

`lun4rmood/lib/shared/theme/app_theme.dart`
Utilite reelle : ThemeData sombre central utilise par l'application.
A modifier si : on change les comportements Material globaux.
A eviter si : on veut seulement modifier le contenu d'une page.

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
Real purpose: Lun4rMood MaterialApp root, connected to the global theme and shell.
Modify if: the global ThemeData, app title, or displayed root changes.
Avoid if: you only want to edit the internal content of a feature.

`lun4rmood/lib/app/app_shell.dart`
Real purpose: five-tab navigation shell between the main MVP screens; Check-in is accessed through the Dashboard quick capture.
Modify if: tabs, order, icons, or the page shown by a tab changes.
Avoid if: you only want to edit the content of a page.

`lun4rmood/lib/app/router.dart`
Real purpose: manual route constants reserved for isolated views or future navigation.
Modify if: a named route must be exposed without changing the main navigation.
Avoid if: no explicit route is requested.

### features/

`lun4rmood/lib/features/home/home_page.dart`
Real purpose: Home dashboard for the MVP shell, based on the Flutter v1 reference mockup.
Modify if: the lunar section, embedded Check-in, daily summary, or CRYSTAPH3Y bubble changes.
Avoid if: you want to change the navigation bar.

`lun4rmood/lib/features/intro/splash_intro_view.dart`
Real purpose: isolated SplashIntroView preparing the lunar and phoenix introduction.
Modify if: a task asks to evolve the intro, moon, Enter button, or future animation.
Avoid if: you want to change the current app startup without an explicit decision.

`lun4rmood/lib/features/check_in/check_in_page.dart`
Real purpose: full daily Check-in view kept outside the main navigation; its widgets support the Dashboard quick capture.
Modify if: the overall Check-in structure changes.
Avoid if: you only want to modify an isolated slider, field, or button.

`lun4rmood/lib/features/check_in/widgets/check_in_slider.dart`
Real purpose: reusable widget for Check-in /10 values.
Modify if: the shared look or behavior of sliders changes.
Avoid if: you only want to change page text or section order.

`lun4rmood/lib/features/check_in/widgets/check_in_quick_entry.dart`
Real purpose: Dashboard quick capture that creates or updates the day's `UserDailyEntry` through a repository.
Modify if: the embedded form or raw user-data mapping changes.
Avoid if: you only want to change the main navigation.

`lun4rmood/lib/features/check_in/widgets/check_in_note_field.dart`
Real purpose: short note field for the Check-in.
Modify if: note input, line limits, or helper text changes.
Avoid if: you want to edit numeric Check-in values.

`lun4rmood/lib/features/check_in/widgets/save_check_in_button.dart`
Real purpose: visual save button for the Check-in.
Modify if: the label or visible action of the button changes.
Avoid if: you want to add real storage without an explicit technical decision.

`lun4rmood/lib/features/journal/journal_page.dart`
Real purpose: selectable daily timeline observing repository `UserDailyEntry` records.
Modify if: navigation between days or Journal entry presentation changes.
Avoid if: persistence is requested without an explicit technical decision.

`lun4rmood/lib/features/journal/widgets/journal_timeline.dart`
Real purpose: horizontally swipeable day list with visual selection handling.
Modify if: the number, format, or appearance of visible days changes.
Avoid if: only the daily summary content changes.

`lun4rmood/lib/features/journal/widgets/journal_day_summary.dart`
Real purpose: daily Journal entry summary card or empty-day state.
Modify if: displayed metrics, notes, or the empty state changes.
Avoid if: only timeline navigation changes.

`lun4rmood/lib/features/statistics/statistics_page.dart`
Real purpose: Statistics placeholder page for future trends.
Modify if: a task asks to evolve the Statistics screen.
Avoid if: statistical data is not defined yet.

`lun4rmood/lib/features/phoenix/phoenix_page.dart`
Real purpose: Phoenix placeholder page with a simple visual egg representation.
Modify if: a task explicitly asks for the phoenix screen or visual logic.
Avoid if: you are only working on data input.

`lun4rmood/lib/features/settings/settings_page.dart`
Real purpose: Settings placeholder page for local data, export, account, and appearance.
Modify if: a task asks for preferences, export, or local control screens.
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
Real purpose: local adapters; currently contains the non-persistent in-memory repository.
Modify if: the local implementation behind a repository contract changes.
Avoid if: Firebase is being added or repositories are being bypassed.

`lun4rmood/lib/data/firebase/`
Real purpose: reserved place for future optional Firebase backup.
Modify if: Firebase is explicitly requested later.
Avoid if: Firebase is outside the task scope.

`lun4rmood/lib/data/repositories/`
Real purpose: data access contracts independent from the future storage engine.
Modify if: read, observation, or save operations evolve.
Avoid if: only a local implementation changes.

`lun4rmood/lib/data/models/user/user_daily_entry.dart`
Real purpose: source of truth for raw daily data created by the user.
Modify if: the canonical Quick Capture / Journal / Statistics schema evolves.
Avoid if: derived or technical data is being added.

`lun4rmood/lib/data/models/derived/daily_summary.dart`
Real purpose: locally derived data separated from raw user entries.
Modify if: the summary, trend, tag, or indicator contract evolves.
Avoid if: user input changes.

`lun4rmood/lib/data/models/settings/user_settings.dart`
Real purpose: theme and UI/application preferences without consent.
Modify if: user preferences evolve.
Avoid if: a privacy decision is being added.

`lun4rmood/lib/data/models/privacy/consent_settings.dart`
Real purpose: explicit cloud, analytics, research, and AI-feature consent, disabled by default.
Modify if: consent governance evolves.
Avoid if: only a visual preference changes.

`lun4rmood/lib/data/privacy/user_daily_entry_privacy_mapper.dart`
Real purpose: projection without short or Journal notes for future consented exports.
Modify if: data exclusion rules evolve.
Avoid if: data should be sent or full anonymization is being claimed.

### shared/

`lun4rmood/lib/shared/widgets/app_page.dart`
Real purpose: common page structure with centered top logo, dark starry background, safe area, and scroll.
Modify if: the main page frame changes.
Avoid if: only one page needs a local adjustment.

`lun4rmood/lib/shared/widgets/app_logo_header.dart`
Real purpose: reusable centered Lun4rMood logo for main pages.
Modify if: the global logo asset, size, or spacing changes.
Avoid if: an isolated screen needs a specific logo.

`lun4rmood/lib/shared/widgets/starry_background.dart`
Real purpose: reusable subtle black starry background behind pages.
Modify if: global star density, opacity, or placement changes.
Avoid if: a local background must stay different for a specific animation.

`lun4rmood/lib/shared/widgets/app_card.dart`
Real purpose: common visual card for framed content.
Modify if: the shared card appearance changes.
Avoid if: the need concerns a feature-specific card.

`lun4rmood/lib/shared/widgets/`
Real purpose: reserved place for widgets reused across features.
Modify if: a widget is truly shared by several areas.
Avoid if: the widget clearly belongs to one feature only.

`lun4rmood/lib/shared/theme/app_colors.dart`
Real purpose: central Lun4rMood color palette.
Modify if: a decision asks to change the global palette.
Avoid if: you only want to test a local color in one page.

`lun4rmood/lib/shared/theme/app_gradients.dart`
Real purpose: central PH3YNYX gradients for backgrounds, accents, and components.
Modify if: a decision asks to change global gradients.
Avoid if: a gradient is strictly specific to an isolated prototype.

`lun4rmood/lib/shared/theme/app_shadows.dart`
Real purpose: central shadows and glows for cards, moon, and accents.
Modify if: a decision asks to change global glow intensity.
Avoid if: a local shadow belongs to a specific animation or state.

`lun4rmood/lib/shared/theme/app_spacing.dart`
Real purpose: shared spacing constants.
Modify if: the global spacing scale changes.
Avoid if: one page only needs a local layout adjustment.

`lun4rmood/lib/shared/theme/app_radius.dart`
Real purpose: shared radius constants.
Modify if: the global corner style changes.
Avoid if: one component has a specific constraint.

`lun4rmood/lib/shared/theme/app_text_styles.dart`
Real purpose: shared text styles.
Modify if: global typography changes.
Avoid if: you only want to change a sentence or label.

`lun4rmood/lib/shared/theme/app_theme.dart`
Real purpose: central dark ThemeData used by the app.
Modify if: global Material behavior changes.
Avoid if: you only want to edit page content.

`lun4rmood/lib/shared/theme/`
Real purpose: reserved place for shared visual theme.
Modify if: a task asks for a global theme.
Avoid if: you are only adjusting a local component.

`lun4rmood/lib/shared/utils/`
Real purpose: reserved place for reusable utilities.
Modify if: a function is useful in several areas.
Avoid if: local logic is enough.
