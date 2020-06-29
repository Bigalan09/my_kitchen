import 'package:my_kitchen/common/mvi/viewmodel.dart';
import 'package:my_kitchen/screens/dashboard/state.dart';

class DashboardViewModel extends BaseViewModel<DashboardState> {
  @override
  DashboardState initialState() => DashboardState.loading();
}