import 'package:my_kitchen/localization/localization.dart';

class LocalizationEN implements Localization {

  @override String get title => 'My Kitchen';
  @override String get recipeTitle => 'Pizza';
  @override String get insiderInfo => 'Insider Info';
  @override String get searchPlaceholder => 'Search recipes...';
  @override String get recommendedRecipes => 'Recommended Recipes';
  @override String get dashboardWelcomeText => 'What would you like to cook today?';
}