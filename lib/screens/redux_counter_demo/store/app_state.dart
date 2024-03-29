import 'package:flutter_redux_demo/screens/redux_counter_demo/reducer/app_reducer.dart';
import '../model/counter_state.dart';

class AppState {
  final CounterState counterState;

  AppState({required this.counterState});

  factory AppState.initial() {
    return AppState(
      counterState: CounterState(
        count: 0,
        totalActions: 0,
        lastActionPerformed: CounterActions.reset.name,
      ),
    );
  }

  static AppState? fromJson(dynamic json) {
    return json != null
        ? AppState(
            counterState: CounterState.fromJson(json["counter_state"])!,
          )
        : null;
  }

  dynamic toJson() {
    return {
      'counter_state': counterState.toJson(),
    };
  }
}
