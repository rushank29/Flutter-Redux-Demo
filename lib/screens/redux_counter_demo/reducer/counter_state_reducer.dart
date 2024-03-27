import 'package:flutter_redux_demo/screens/redux_counter_demo/actions/actions.dart';
import 'package:flutter_redux_demo/screens/redux_counter_demo/model/counter_state.dart';
import 'package:flutter_redux_demo/screens/redux_counter_demo/store/app_state.dart';
import 'package:redux/redux.dart';

// Defining counter actions here
enum CounterActions { increment, decrement, reset }

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    counterState: counterReducer(state.counterState, action),
  );
}

final counterReducer = combineReducers<CounterState>([
  TypedReducer<CounterState, IncrementAction>(_incrementAction),
  TypedReducer<CounterState, DecrementAction>(_decrementAction),
  TypedReducer<CounterState, ResetAction>(_resetAction),
]);

late int count;
late int totalActions;
late CounterActions lastActionPerformed;

CounterState _incrementAction(CounterState state, dynamic action) {
  count = state.count + 1;
  totalActions = state.totalActions + 1;
  lastActionPerformed = CounterActions.increment;
  return CounterState(
    count: count,
    totalActions: totalActions,
    lastActionPerformed: lastActionPerformed.name,
  );
}

CounterState _decrementAction(CounterState state, dynamic action) {
  count = state.count - 1;
  totalActions = state.totalActions + 1;
  lastActionPerformed = CounterActions.decrement;
  return CounterState(
    count: count,
    totalActions: totalActions,
    lastActionPerformed: lastActionPerformed.name,
  );
}

CounterState _resetAction(CounterState state, dynamic action) {
  count = 0;
  totalActions = state.totalActions + 1;
  lastActionPerformed = CounterActions.reset;
  return CounterState(
    count: count,
    totalActions: totalActions,
    lastActionPerformed: lastActionPerformed.name,
  );
}
