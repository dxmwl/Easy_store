import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'main.dart';
import 'config/brutal_theme.dart';
import 'core/services/storage_service.dart';
import 'core/api/github_api.dart';
import 'features/home/home_screen.dart';
import 'features/leaderboard/leaderboard_screen.dart';
import 'features/library/library_screen.dart';
import 'features/profile/profile_screen.dart';
import 'shared/widgets/brutal_nav_bar.dart';

class EasyStoreApp extends ConsumerStatefulWidget {
  final StorageService storageService;

  const EasyStoreApp({super.key, required this.storageService});

  @override
  ConsumerState<EasyStoreApp> createState() => _EasyStoreAppState();
}

class _EasyStoreAppState extends ConsumerState<EasyStoreApp> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _initAuth();
  }

  void _initAuth() {
    final token = widget.storageService.getAuthToken();
    if (token != null) {
      ref.read(githubApiProvider).setToken(token);
    }
  }

  Widget _buildCurrentScreen() {
    switch (_currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const LeaderboardScreen();
      case 2:
        return const LibraryScreen();
      case 3:
        return const ProfileScreen();
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    final localeState = ref.watch(localeProvider);
    final currentLocale = localeState.resolvedLocale;

    return MaterialApp(
      title: 'Easy Store',
      debugShowCheckedModeBanner: false,
      locale: currentLocale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        scaffoldBackgroundColor: BrutalTheme.canvas,
        colorScheme: ColorScheme.light(
          primary: BrutalTheme.primary,
          onPrimary: BrutalTheme.white,
          surface: BrutalTheme.surface,
          onSurface: BrutalTheme.ink,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: BrutalTheme.canvas,
          foregroundColor: BrutalTheme.ink,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
      ),
      home: Builder(
        builder: (context) {
          final l10n = AppLocalizations.of(context)!;
          return Scaffold(
            body: _buildCurrentScreen(),
            bottomNavigationBar: BrutalNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: [
                BrutalNavItem(icon: Icons.home, label: l10n.discover),
                BrutalNavItem(icon: Icons.leaderboard, label: l10n.leaderboard),
                BrutalNavItem(icon: Icons.book, label: l10n.library),
                BrutalNavItem(icon: Icons.person, label: l10n.profile),
              ],
            ),
          );
        },
      ),
    );
  }
}
