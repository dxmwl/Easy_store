import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../l10n/app_localizations.dart';
import '../../main.dart';
import '../../core/providers/locale_provider.dart';
import '../../config/brutal_theme.dart';
import '../../shared/widgets/brutal_widgets.dart';
import '../../features/auth/auth_screen.dart';
import '../../features/profile/language_screen.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final localeState = ref.watch(localeProvider);
    final currentLangName = LocaleProvider.getLanguageName(localeState.locale.languageCode);
    
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
                    l10n.profile.toUpperCase(),
                    style: BrutalTheme.headingStyle.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  BrutalCard(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: BrutalTheme.surface,
                            border: Border.all(color: BrutalTheme.ink, width: 2),
                          ),
                          child: const Icon(
                            Icons.person,
                            size: 48,
                            color: BrutalTheme.ink,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          l10n.notSignedIn.toUpperCase(),
                          style: BrutalTheme.headingStyle.copyWith(fontSize: 14),
                        ),
                        const SizedBox(height: 12),
                        BrutalButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const AuthScreen()),
                            );
                          },
                          child: Text(l10n.signInWithGithub.toUpperCase()),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildSectionHeader(l10n.settings.toUpperCase()),
                  const SizedBox(height: 12),
                  _buildSettingItem(
                    context,
                    Icons.language,
                    l10n.language.toUpperCase(),
                    trailing: Text(
                      currentLangName,
                      style: BrutalTheme.metaStyle.copyWith(color: BrutalTheme.primary),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const LanguageScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  _buildSettingItem(context, Icons.palette, l10n.appearance.toUpperCase()),
                  const SizedBox(height: 8),
                  _buildSettingItem(context, Icons.wifi, l10n.network.toUpperCase()),
                  const SizedBox(height: 8),
                  _buildSettingItem(context, Icons.info_outline, l10n.about.toUpperCase()),
                  const SizedBox(height: 24),
                  _buildSectionHeader(l10n.about.toUpperCase()),
                  const SizedBox(height: 12),
                  _buildInfoItem(l10n.version.toUpperCase(), '1.0.0'),
                  const SizedBox(height: 8),
                  _buildInfoItem(l10n.platform.toUpperCase(), 'FLUTTER'),
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

  Widget _buildSettingItem(BuildContext context, IconData icon, String label, {Widget? trailing, VoidCallback? onTap}) {
    return BrutalCard(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Row(
        children: [
          Icon(icon, size: 20, color: BrutalTheme.ink),
          const SizedBox(width: 12),
          Text(
            label,
            style: BrutalTheme.subheadingStyle.copyWith(fontSize: 13),
          ),
          const Spacer(),
          if (trailing != null) trailing,
          if (trailing != null) const SizedBox(width: 8),
          const Icon(Icons.chevron_right, size: 20, color: BrutalTheme.ink),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return BrutalCard(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Row(
        children: [
          Text(
            label,
            style: BrutalTheme.metaStyle,
          ),
          const Spacer(),
          Text(
            value,
            style: BrutalTheme.subheadingStyle.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
