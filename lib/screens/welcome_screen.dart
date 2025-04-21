import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeScreen extends StatelessWidget {
  final Locale currentLocale;
  final void Function(Locale) onLocaleChange;

  const WelcomeScreen({
    Key? key,
    required this.currentLocale,
    required this.onLocaleChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F0EB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Locale>(
                    value: currentLocale,
                    onChanged: (locale) {
                      if (locale != null) onLocaleChange(locale);
                    },
                    items: [
                      DropdownMenuItem(value: const Locale('en'), child: Text('EN')),
                      DropdownMenuItem(value: const Locale('es'), child: Text('ES')),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Text('M+', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFF2E5D62))),
              const SizedBox(height: 16),
              Text(t.appTitle, style: TextStyle(fontSize: 22, color: Colors.black54)),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2E5D62),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: Text(t.startPractice, style: const TextStyle(color: Colors.white)),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
