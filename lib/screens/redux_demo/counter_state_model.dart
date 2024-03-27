import 'counter_state.dart';

// Redux
class CounterStateModel {
  final int count;
  final int totalActions;
  final CounterActions? lastActionPerformed;

  CounterStateModel({
    required this.count,
    required this.totalActions,
    required this.lastActionPerformed,
  });
}
