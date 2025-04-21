// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Welcome to M+';

  @override
  String get startPractice => 'Start my practice';

  @override
  String get dailyAffirmationTitle => 'Affirmation of the day';

  @override
  String get howDoYouFeel => 'How do you feel today?';

  @override
  String get dailyAffirmationContent => 'My potential for success is unlimited';

  @override
  String get dailyProgress => 'Daily progress';

  @override
  String get goToGuidedPractice => 'Go to guided practice';
}
