import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/welcome_screen.dart';
import 'theme/app_theme.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(MPlusApp());
}

class MPlusApp extends StatefulWidget {
  @override
  State<MPlusApp> createState() => _MPlusAppState();
}

class _MPlusAppState extends State<MPlusApp> {
  Locale _locale = const Locale('en');

  void _changeLocale(Locale newLocale) {
    setState(() => _locale = newLocale);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M+',
      theme: AppTheme.light,
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: WelcomeScreen(
        currentLocale: _locale,
        onLocaleChange: _changeLocale,
      ),
    );
  }
}
