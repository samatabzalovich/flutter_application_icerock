import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Github';

  @override
  String get textFieldText => 'Personal access token';

  @override
  String get signIn => 'Sign In';

  @override
  String get repositories => 'Repositories';

  @override
  String get license => 'License';

  @override
  String get stars => 'stars';

  @override
  String get forks => 'forks';

  @override
  String get watchers => 'watchers';

  @override
  String get emptyTitle => 'Empty';

  @override
  String get emptySubtitle => 'No repositories at the moment';

  @override
  String get refresh => 'Refresh';

  @override
  String get retry => 'Retry';

  @override
  String get conTitle => 'Connection error';

  @override
  String get conSubtitle => 'Check your Internet connection';

  @override
  String get loadTitle => 'Load error';

  @override
  String get somethingErrorTitle => 'Something Error';

  @override
  String get somethingErrorSubtitle => 'Check your something';

  @override
  String get dialogTitle => 'Error';

  @override
  String get dialogDescription => 'Error data / error code\n information for developers';

  @override
  String get ok => 'Ok';

  @override
  String get invalidToken => 'Invalid token';

  @override
  String get noReadme => 'No README.md';

  @override
  String get pageNotFound => 'Page does not exist';
}
