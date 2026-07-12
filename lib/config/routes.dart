import 'package:go_router/go_router.dart';
import '../features/home/home_screen.dart';
import '../features/search/search_screen.dart';
import '../features/repository/repository_screen.dart';
import '../features/downloads/downloads_screen.dart';
import '../features/library/library_screen.dart';
import '../features/profile/profile_screen.dart';
import '../features/auth/auth_screen.dart';

final routerProvider = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/downloads',
      builder: (context, state) => const DownloadsScreen(),
    ),
    GoRoute(
      path: '/library',
      builder: (context, state) => const LibraryScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/repo/:owner/:repo',
      builder: (context, state) {
        final owner = state.pathParameters['owner']!;
        final repo = state.pathParameters['repo']!;
        return RepositoryScreen(owner: owner, repo: repo);
      },
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthScreen(),
    ),
  ],
);
