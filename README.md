# M+ App

A holistic wellness app powered by Flutter, Firebase, and OpenAI.

## Features

- Daily manifestation practice flow
- Guided steps: intention, visualization, journaling, action
- AI-generated personalized manifestation plans

## OpenAI API Key

Use flutter_dotenv to load your OpenAI key:

```
flutter pub add flutter_dotenv
```

Then, create a `.env` file and load it in `main.dart`.


## Localization

This app uses Flutter's localization system. To use it:

1. Add flutter_localizations and intl to pubspec.yaml:

```
flutter pub add flutter_localizations
flutter pub add intl
```

2. Add the following to your MaterialApp widget:

```dart
localizationsDelegates: [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
],
supportedLocales: [
  Locale('en', ''),
  Locale('es', ''),
],
```

3. Create a `lib/l10n` folder and add ARB files (`app_en.arb`, `app_es.arb`)
