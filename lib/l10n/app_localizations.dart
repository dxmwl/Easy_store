import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('pl'),
    Locale('ru'),
    Locale('tr'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Easy Store'**
  String get appTitle;

  /// No description provided for @discover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get discover;

  /// No description provided for @downloads.
  ///
  /// In en, this message translates to:
  /// **'Downloads'**
  String get downloads;

  /// No description provided for @library.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get library;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @trending.
  ///
  /// In en, this message translates to:
  /// **'Trending'**
  String get trending;

  /// No description provided for @recentlyUpdated.
  ///
  /// In en, this message translates to:
  /// **'Recently Updated'**
  String get recentlyUpdated;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @searchRepos.
  ///
  /// In en, this message translates to:
  /// **'Search repositories...'**
  String get searchRepos;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No Data'**
  String get noData;

  /// No description provided for @noDownloads.
  ///
  /// In en, this message translates to:
  /// **'No Downloads'**
  String get noDownloads;

  /// No description provided for @downloadedFilesWillAppear.
  ///
  /// In en, this message translates to:
  /// **'Downloaded files will appear here'**
  String get downloadedFilesWillAppear;

  /// No description provided for @emptyLibrary.
  ///
  /// In en, this message translates to:
  /// **'Empty Library'**
  String get emptyLibrary;

  /// No description provided for @favoriteReposWillAppear.
  ///
  /// In en, this message translates to:
  /// **'Favorite repos will appear here'**
  String get favoriteReposWillAppear;

  /// No description provided for @notSignedIn.
  ///
  /// In en, this message translates to:
  /// **'Not Signed In'**
  String get notSignedIn;

  /// No description provided for @signInWithGithub.
  ///
  /// In en, this message translates to:
  /// **'Sign In with GitHub'**
  String get signInWithGithub;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @network.
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get network;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @platform.
  ///
  /// In en, this message translates to:
  /// **'Platform'**
  String get platform;

  /// No description provided for @stars.
  ///
  /// In en, this message translates to:
  /// **'STARS'**
  String get stars;

  /// No description provided for @forks.
  ///
  /// In en, this message translates to:
  /// **'FORKS'**
  String get forks;

  /// No description provided for @issues.
  ///
  /// In en, this message translates to:
  /// **'ISSUES'**
  String get issues;

  /// No description provided for @releases.
  ///
  /// In en, this message translates to:
  /// **'Releases'**
  String get releases;

  /// No description provided for @noReleases.
  ///
  /// In en, this message translates to:
  /// **'No Releases'**
  String get noReleases;

  /// No description provided for @filesAvailable.
  ///
  /// In en, this message translates to:
  /// **'{count} FILES AVAILABLE'**
  String filesAvailable(int count);

  /// No description provided for @stable.
  ///
  /// In en, this message translates to:
  /// **'STABLE'**
  String get stable;

  /// No description provided for @beta.
  ///
  /// In en, this message translates to:
  /// **'BETA'**
  String get beta;

  /// No description provided for @readMore.
  ///
  /// In en, this message translates to:
  /// **'READ >'**
  String get readMore;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'RETRY'**
  String get retry;

  /// No description provided for @loadError.
  ///
  /// In en, this message translates to:
  /// **'LOAD ERROR'**
  String get loadError;

  /// No description provided for @searchFailed.
  ///
  /// In en, this message translates to:
  /// **'SEARCH FAILED'**
  String get searchFailed;

  /// No description provided for @typeToSearch.
  ///
  /// In en, this message translates to:
  /// **'TYPE TO SEARCH'**
  String get typeToSearch;

  /// No description provided for @signingIn.
  ///
  /// In en, this message translates to:
  /// **'Signing In'**
  String get signingIn;

  /// No description provided for @authentication.
  ///
  /// In en, this message translates to:
  /// **'AUTHENTICATION'**
  String get authentication;

  /// No description provided for @signInDescription.
  ///
  /// In en, this message translates to:
  /// **'Sign in to access your starred repos and sync your data.'**
  String get signInDescription;

  /// No description provided for @useAccessToken.
  ///
  /// In en, this message translates to:
  /// **'USE ACCESS TOKEN'**
  String get useAccessToken;

  /// No description provided for @tokenInput.
  ///
  /// In en, this message translates to:
  /// **'TOKEN INPUT'**
  String get tokenInput;

  /// No description provided for @githubPersonalAccessToken.
  ///
  /// In en, this message translates to:
  /// **'GITHUB PERSONAL ACCESS TOKEN'**
  String get githubPersonalAccessToken;

  /// No description provided for @authenticate.
  ///
  /// In en, this message translates to:
  /// **'AUTHENTICATE'**
  String get authenticate;

  /// No description provided for @easyStore.
  ///
  /// In en, this message translates to:
  /// **'EASY STORE'**
  String get easyStore;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @systemDefault.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get systemDefault;

  /// No description provided for @selectYourPlatform.
  ///
  /// In en, this message translates to:
  /// **'SELECT YOUR PLATFORM'**
  String get selectYourPlatform;

  /// No description provided for @allPlatforms.
  ///
  /// In en, this message translates to:
  /// **'ALL PLATFORMS'**
  String get allPlatforms;

  /// No description provided for @linux.
  ///
  /// In en, this message translates to:
  /// **'LINUX'**
  String get linux;

  /// No description provided for @ios.
  ///
  /// In en, this message translates to:
  /// **'iOS'**
  String get ios;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'ALL'**
  String get all;

  /// No description provided for @ai.
  ///
  /// In en, this message translates to:
  /// **'AI'**
  String get ai;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'PRIVACY'**
  String get privacy;

  /// No description provided for @networkCategory.
  ///
  /// In en, this message translates to:
  /// **'NETWORK'**
  String get networkCategory;

  /// No description provided for @media.
  ///
  /// In en, this message translates to:
  /// **'MEDIA'**
  String get media;

  /// No description provided for @social.
  ///
  /// In en, this message translates to:
  /// **'SOCIAL'**
  String get social;

  /// No description provided for @reading.
  ///
  /// In en, this message translates to:
  /// **'READING'**
  String get reading;

  /// No description provided for @tools.
  ///
  /// In en, this message translates to:
  /// **'TOOLS'**
  String get tools;

  /// No description provided for @games.
  ///
  /// In en, this message translates to:
  /// **'GAMES'**
  String get games;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bn',
    'en',
    'es',
    'fr',
    'hi',
    'it',
    'ja',
    'ko',
    'pl',
    'ru',
    'tr',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'pl':
      return AppLocalizationsPl();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
