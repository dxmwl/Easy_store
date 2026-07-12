// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Magasin Facile';

  @override
  String get discover => 'Découvrir';

  @override
  String get downloads => 'Téléchargements';

  @override
  String get library => 'Bibliothèque';

  @override
  String get profile => 'Profil';

  @override
  String get trending => 'Tendance';

  @override
  String get recentlyUpdated => 'Récemment Mis à Jour';

  @override
  String get search => 'Rechercher';

  @override
  String get searchRepos => 'Rechercher des dépôts...';

  @override
  String get cancel => 'Annuler';

  @override
  String get noData => 'Aucune Donnée';

  @override
  String get noDownloads => 'Aucun Téléchargement';

  @override
  String get downloadedFilesWillAppear =>
      'Les fichiers téléchargés apparaîtront ici';

  @override
  String get emptyLibrary => 'Bibliothèque Vide';

  @override
  String get favoriteReposWillAppear => 'Les dépôts favoris apparaîtront ici';

  @override
  String get notSignedIn => 'Non Connecté';

  @override
  String get signInWithGithub => 'Se Connecter avec GitHub';

  @override
  String get settings => 'Paramètres';

  @override
  String get appearance => 'Apparence';

  @override
  String get network => 'Réseau';

  @override
  String get about => 'À Propos';

  @override
  String get version => 'Version';

  @override
  String get platform => 'Plateforme';

  @override
  String get stars => 'ÉTOILES';

  @override
  String get forks => 'FORKS';

  @override
  String get issues => 'PROBLÈMES';

  @override
  String get releases => 'Versions';

  @override
  String get noReleases => 'Aucune Version';

  @override
  String filesAvailable(int count) {
    return '$count FICHIERS DISPONIBLES';
  }

  @override
  String get stable => 'STABLE';

  @override
  String get beta => 'BÊTA';

  @override
  String get readMore => 'LIRE >';

  @override
  String get retry => 'RÉESSAYER';

  @override
  String get loadError => 'ERREUR DE CHARGEMENT';

  @override
  String get searchFailed => 'RECHERCHE ÉCHOUÉE';

  @override
  String get typeToSearch => 'TAPER POUR RECHERCHER';

  @override
  String get signingIn => 'Connexion en Cours';

  @override
  String get authentication => 'AUTHENTIFICATION';

  @override
  String get signInDescription =>
      'Connectez-vous pour accéder à vos dépôts favoris et synchroniser vos données.';

  @override
  String get useAccessToken => 'UTILISER LE JETON D\'ACCÈS';

  @override
  String get tokenInput => 'ENTRÉE DU JETON';

  @override
  String get githubPersonalAccessToken => 'JETON D\'ACCÈS PERSONNEL GITHUB';

  @override
  String get authenticate => 'AUTHENTIFIER';

  @override
  String get easyStore => 'MAGASIN FACILE';

  @override
  String get language => 'Langue';

  @override
  String get systemDefault => 'Par Défaut du Système';

  @override
  String get selectYourPlatform => 'SÉLECTIONNEZ VOTRE PLATEFORME';

  @override
  String get allPlatforms => 'TOUTES LES PLATEFORMES';

  @override
  String get linux => 'LINUX';

  @override
  String get ios => 'iOS';

  @override
  String get all => 'TOUT';

  @override
  String get ai => 'IA';

  @override
  String get privacy => 'CONFIDENTIALITÉ';

  @override
  String get networkCategory => 'RÉSEAU';

  @override
  String get media => 'MÉDIAS';

  @override
  String get social => 'SOCIAL';

  @override
  String get reading => 'LECTURE';

  @override
  String get tools => 'OUTILS';

  @override
  String get games => 'JEUX';
}
