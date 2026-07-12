import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _searchHistoryKey = 'search_history';
  static const String _favoritesKey = 'favorites';
  static const String _authTokenKey = 'auth_token';
  static const String _themeKey = 'theme_mode';
  
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  List<String> getSearchHistory() {
    return _prefs.getStringList(_searchHistoryKey) ?? [];
  }

  Future<void> addSearchQuery(String query) async {
    if (query.trim().isEmpty) return;
    
    final history = getSearchHistory();
    history.remove(query);
    history.insert(0, query);
    
    if (history.length > 20) {
      history.removeLast();
    }
    
    await _prefs.setStringList(_searchHistoryKey, history);
  }

  Future<void> clearSearchHistory() async {
    await _prefs.remove(_searchHistoryKey);
  }

  List<String> getFavorites() {
    return _prefs.getStringList(_favoritesKey) ?? [];
  }

  Future<void> addFavorite(String repoFullName) async {
    final favorites = getFavorites();
    if (!favorites.contains(repoFullName)) {
      favorites.add(repoFullName);
      await _prefs.setStringList(_favoritesKey, favorites);
    }
  }

  Future<void> removeFavorite(String repoFullName) async {
    final favorites = getFavorites();
    favorites.remove(repoFullName);
    await _prefs.setStringList(_favoritesKey, favorites);
  }

  bool isFavorite(String repoFullName) {
    return getFavorites().contains(repoFullName);
  }

  String? getAuthToken() {
    return _prefs.getString(_authTokenKey);
  }

  Future<void> setAuthToken(String? token) async {
    if (token != null) {
      await _prefs.setString(_authTokenKey, token);
    } else {
      await _prefs.remove(_authTokenKey);
    }
  }

  String getThemeMode() {
    return _prefs.getString(_themeKey) ?? 'system';
  }

  Future<void> setThemeMode(String mode) async {
    await _prefs.setString(_themeKey, mode);
  }
}
