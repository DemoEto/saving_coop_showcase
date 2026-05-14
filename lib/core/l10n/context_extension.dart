import 'package:flutter/widgets.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
 import 'app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get t => AppLocalizations.of(this)!;
}
