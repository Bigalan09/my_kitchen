import 'package:my_kitchen/common/mvi/state.dart';

class DashboardState {
  State state;

  DashboardState(this.state);

  static loading() => DashboardState(DashboardStateLoading());
}

class DashboardStateLoading extends State {}