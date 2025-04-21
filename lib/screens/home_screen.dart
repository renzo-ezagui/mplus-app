import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(localizations.welcome)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(localizations.dailyAffirmation),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text(localizations.startPractice),
            ),
          ],
        ),
      ),
    );
  }
}
