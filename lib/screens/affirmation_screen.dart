import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../theme/app_theme.dart';

class AffirmationScreen extends StatelessWidget {
  const AffirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppTheme.isabelline,
      appBar: AppBar(
        backgroundColor: AppTheme.isabelline,
        elevation: 0,
        iconTheme: IconThemeData(color: AppTheme.darkSlate),
        title: Text(
          t.dailyAffirmationTitle,
          style: TextStyle(color: AppTheme.darkSlate),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              t.howDoYouFeel,
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: AppTheme.lavender,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(24),
              child: Text(
                t.dailyAffirmationContent,
                style: TextStyle(
                  fontSize: 20,
                  color: AppTheme.darkSlate,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              t.dailyProgress,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: 0.25,
              backgroundColor: AppTheme.ashGray.withOpacity(0.3),
              valueColor: AlwaysStoppedAnimation<Color>(AppTheme.darkSlate),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.darkSlate,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text(t.goToGuidedPractice, style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
