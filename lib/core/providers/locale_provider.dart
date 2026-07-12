import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  static const String _localeKey = 'selected_locale';
  Locale _locale = const Locale('system');

  Locale get locale => _locale;
  bool get isSystemLocale => _locale.languageCode == 'system';

  LocaleProvider() {
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_localeKey) ?? 'system';
    _locale = Locale(code);
    notifyListeners();
  }

  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
    notifyListeners();
  }

  Locale? get resolvedLocale {
    if (_locale.languageCode == 'system') return null;
    return _locale;
  }

  static List<Locale> get supportedLocales => const [
    Locale('system'),
    Locale('en'),
    Locale('ar'),
    Locale('bn'),
    Locale('zh'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('pl'),
    Locale('ru'),
    Locale('tr'),
  ];

  static String getLanguageName(String code) {
    switch (code) {
      case 'system': return 'System Default';
      case 'en': return 'English';
      case 'ar': return 'العربية';
      case 'bn': return 'বাংলা';
      case 'zh': return '简体中文';
      case 'es': return 'Español';
      case 'fr': return 'Français';
      case 'hi': return 'हिन्दी';
      case 'it': return 'Italiano';
      case 'ja': return '日本語';
      case 'ko': return '한국어';
      case 'pl': return 'Polski';
      case 'ru': return 'Русский';
      case 'tr': return 'Türkçe';
      default: return code;
    }
  }
}
