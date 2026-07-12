// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Лёгкий Магазин';

  @override
  String get discover => 'Открыть';

  @override
  String get downloads => 'Загрузки';

  @override
  String get library => 'Библиотека';

  @override
  String get profile => 'Профиль';

  @override
  String get trending => 'Популярное';

  @override
  String get recentlyUpdated => 'Недавно Обновлённое';

  @override
  String get search => 'Поиск';

  @override
  String get searchRepos => 'Поиск репозиториев...';

  @override
  String get cancel => 'Отмена';

  @override
  String get noData => 'Нет Данных';

  @override
  String get noDownloads => 'Нет Загрузок';

  @override
  String get downloadedFilesWillAppear => 'Загруженные файлы появятся здесь';

  @override
  String get emptyLibrary => 'Пустая Библиотека';

  @override
  String get favoriteReposWillAppear => 'Избранные репозитории появятся здесь';

  @override
  String get notSignedIn => 'Не Входили';

  @override
  String get signInWithGithub => 'Войти через GitHub';

  @override
  String get settings => 'Настройки';

  @override
  String get appearance => 'Внешний вид';

  @override
  String get network => 'Сеть';

  @override
  String get about => 'О Приложении';

  @override
  String get version => 'Версия';

  @override
  String get platform => 'Платформа';

  @override
  String get stars => 'ЗВЁЗДЫ';

  @override
  String get forks => 'ФОРКИ';

  @override
  String get issues => 'ПРОБЛЕМЫ';

  @override
  String get releases => 'Релизы';

  @override
  String get noReleases => 'Нет Релизов';

  @override
  String filesAvailable(int count) {
    return '$count ФАЙЛОВ ДОСТУПНО';
  }

  @override
  String get stable => 'СТАБИЛЬНАЯ';

  @override
  String get beta => 'БЕТА';

  @override
  String get readMore => 'ЧИТАТЬ >';

  @override
  String get retry => 'ПОВТОРИТЬ';

  @override
  String get loadError => 'ОШИБКА ЗАГРУЗКИ';

  @override
  String get searchFailed => 'ПОИСК НЕ УДАЛСЯ';

  @override
  String get typeToSearch => 'ВВЕДИТЕ ДЛЯ ПОИСКА';

  @override
  String get signingIn => 'Вход';

  @override
  String get authentication => 'АУТЕНТИФИКАЦИЯ';

  @override
  String get signInDescription =>
      'Войдите, чтобы получить доступ к избранным репозиториям и синхронизировать данные.';

  @override
  String get useAccessToken => 'ИСПОЛЬЗОВАТЬ ТОКЕН ДОСТУПА';

  @override
  String get tokenInput => 'ВВОД ТОКЕНА';

  @override
  String get githubPersonalAccessToken => 'ЛИЧНЫЙ ТОКЕН ДОСТУПА GITHUB';

  @override
  String get authenticate => 'АУТЕНТИФИЦИРОВАТЬ';

  @override
  String get easyStore => 'ЛЁГКИЙ МАГАЗИН';

  @override
  String get language => 'Язык';

  @override
  String get systemDefault => 'Системный По Умолчанию';

  @override
  String get selectYourPlatform => 'ВЫБЕРИТЕ ПЛАТФОРМУ';

  @override
  String get allPlatforms => 'ВСЕ ПЛАТФОРМЫ';

  @override
  String get linux => 'ЛИНУКС';

  @override
  String get ios => 'iOS';

  @override
  String get all => 'ВСЕ';

  @override
  String get ai => 'ИИ';

  @override
  String get privacy => 'КОНФИДЕНЦИАЛЬНОСТЬ';

  @override
  String get networkCategory => 'СЕТЬ';

  @override
  String get media => 'МЕДИА';

  @override
  String get social => 'СОЦИАЛЬНОЕ';

  @override
  String get reading => 'ЧТЕНИЕ';

  @override
  String get tools => 'ИНСТРУМЕНТЫ';

  @override
  String get games => 'ИГРЫ';
}
