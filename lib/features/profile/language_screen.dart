import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../l10n/app_localizations.dart';
import '../../main.dart';
import '../../core/providers/locale_provider.dart';
import '../../config/brutal_theme.dart';
import '../../shared/widgets/brutal_widgets.dart';

class LanguageScreen extends ConsumerWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final localeState = ref.watch(localeProvider);
    final currentCode = localeState.locale.languageCode;

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
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: BrutalTheme.white,
                        border: Border.all(color: BrutalTheme.ink, width: 2),
                      ),
                      child: const Icon(Icons.arrow_back, size: 20),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    l10n.appearance.toUpperCase(),
                    style: BrutalTheme.headingStyle.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildSectionHeader(l10n.language.toUpperCase()),
                  const SizedBox(height: 12),
                  ...LocaleProvider.supportedLocales.map((locale) {
                    final isSelected = locale.languageCode == currentCode;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: BrutalCard(
                        onTap: () {
                          ref.read(localeProvider.notifier).setLocale(locale);
                        },
                        backgroundColor: isSelected ? BrutalTheme.primary : BrutalTheme.canvas,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                LocaleProvider.getLanguageName(locale.languageCode),
                                style: BrutalTheme.subheadingStyle.copyWith(
                                  fontSize: 14,
                                  color: isSelected ? BrutalTheme.white : BrutalTheme.ink,
                                ),
                              ),
                            ),
                            if (isSelected)
                              const Icon(Icons.check, size: 20, color: BrutalTheme.white),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      children: [
        BrutalTag(text: title),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 2,
            color: BrutalTheme.ink,
          ),
        ),
      ],
    );
  }
}
