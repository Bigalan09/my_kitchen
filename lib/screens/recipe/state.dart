import 'package:my_kitchen/common/mvi/state.dart';

class RecipeState {
  State state;

  RecipeState(this.state);

  static loading() => RecipeState(RecipeStateLoading());
}

class RecipeStateLoading extends State {}