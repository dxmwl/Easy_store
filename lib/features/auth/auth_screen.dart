import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../l10n/app_localizations.dart';
import '../../config/brutal_theme.dart';
import '../../shared/widgets/brutal_widgets.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final TextEditingController _tokenController = TextEditingController();
  bool _showTokenInput = false;

  @override
  void dispose() {
    _tokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    l10n.signingIn.toUpperCase(),
                    style: BrutalTheme.headingStyle.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  const SizedBox(height: 32),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: BrutalTheme.primary,
                      border: Border.all(color: BrutalTheme.ink, width: 3),
                    ),
                    child: const Icon(
                      Icons.code,
                      size: 48,
                      color: BrutalTheme.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    l10n.authentication.toUpperCase(),
                    style: BrutalTheme.headingStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n.authentication.toUpperCase(),
                    style: BrutalTheme.labelStyle.copyWith(color: BrutalTheme.primary),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    l10n.signInDescription.toUpperCase(),
                    style: BrutalTheme.bodyStyle.copyWith(height: 1.6),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  BrutalButton(
                    onPressed: () async {
                      final url = Uri.parse('https://github.com/login/device');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.login, size: 18, color: BrutalTheme.white),
                        const SizedBox(width: 8),
                        Text(l10n.signInWithGithub.toUpperCase()),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  BrutalButton(
                    isPrimary: false,
                    onPressed: () {
                      setState(() {
                        _showTokenInput = !_showTokenInput;
                      });
                    },
                    child: Text(l10n.useAccessToken.toUpperCase()),
                  ),
                  if (_showTokenInput) ...[
                    const SizedBox(height: 24),
                    _buildSectionHeader(l10n.tokenInput.toUpperCase()),
                    const SizedBox(height: 12),
                    BrutalTextField(
                      controller: _tokenController,
                      placeholder: l10n.githubPersonalAccessToken.toUpperCase(),
                    ),
                    const SizedBox(height: 16),
                    BrutalButton(
                      onPressed: () {
                        final token = _tokenController.text.trim();
                        if (token.isNotEmpty) {
                          Navigator.of(context).pop(token);
                        }
                      },
                      child: Text(l10n.authenticate.toUpperCase()),
                    ),
                  ],
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
