import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/practice_screen.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(MPlusApp());
}

class MPlusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(primarySwatch: Colors.teal),
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: PracticeScreen(),
    );
  }
}
