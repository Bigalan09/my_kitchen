import 'package:my_kitchen/common/mvi/viewmodel.dart';
import 'package:my_kitchen/screens/recipe/state.dart';

class RecipeViewModel extends BaseViewModel<RecipeState> {
  @override
  RecipeState initialState() => RecipeState.loading();

}