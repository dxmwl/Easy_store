import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../l10n/app_localizations.dart';
import '../../config/brutal_theme.dart';
import '../../shared/widgets/brutal_widgets.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: BrutalTheme.canvas,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              decoration: const BoxDecoration(
                color: BrutalTheme.canvas,
                border: Border(
                  bottom: BorderSide(color: BrutalTheme.ink, width: BrutalTheme.borderWidth),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    l10n.library.toUpperCase(),
                    style: BrutalTheme.headingStyle.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: BrutalCard(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: BrutalTheme.surface,
                          border: Border.all(color: BrutalTheme.ink, width: 2),
                        ),
                        child: const Icon(
                          Icons.book,
                          size: 48,
                          color: BrutalTheme.ink,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        l10n.emptyLibrary.toUpperCase(),
                        style: BrutalTheme.headingStyle.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.favoriteReposWillAppear.toUpperCase(),
                        style: BrutalTheme.bodyStyle.copyWith(color: BrutalTheme.disabled),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
