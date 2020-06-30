import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  @override
  RecipeState get initialState => RecipeInitial();

  @override
  Stream<RecipeState> mapEventToState(
    RecipeEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
