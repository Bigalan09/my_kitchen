import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_kitchen/localization/localization_en.dart';

abstract class Localization {
  static Localization of (BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  String get dashboardWelcomeText => 'Dashboard Welcome Text';
  String get recipeTitle => 'Recipe Title';
  String get title => 'Title';
  String get insiderInfo => 'Insider Info';
  String get searchPlaceholder => 'Search Placeholder';
  String get recommendedRecipes => 'Recommended Recipes';
}

class MyKitchenLocalizationDelegate extends LocalizationsDelegate<Localization> {
  const MyKitchenLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) => _load(locale);

  static Future<Localization> _load(Locale locale) async {
    final String name = (locale.countryCode == null || locale.countryCode.isEmpty) ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    Intl.defaultLocale = localeName;

    return LocalizationEN();
  }

  @override
  bool shouldReload(LocalizationsDelegate<Localization> old) => false;
}