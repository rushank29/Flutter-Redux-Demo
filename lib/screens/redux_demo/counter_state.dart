// Defining counter actions here
import 'package:flutter_redux_demo/screens/redux_demo/counter_state_model.dart';

enum CounterActions { increment, decrement, reset }

// The reducer, which takes the previous count and increments and decrements it in response to
// an Increment and Decrement action respectively.
CounterStateModel counterReducer(CounterStateModel state, dynamic action) {
  int count;
  int actions;
  CounterActions lastActionPerformed;
  if (action == CounterActions.increment) {
    count = state.count + 1;
    actions = state.totalActions + 1;
    lastActionPerformed = CounterActions.increment;
    return CounterStateModel(
      count: count,
      totalActions: actions,
      lastActionPerformed: lastActionPerformed,
    );
  } else if (action == CounterActions.reset) {
    count = 0;
    actions = state.totalActions + 1;
    lastActionPerformed = CounterActions.reset;
    return CounterStateModel(
      count: count,
      totalActions: actions,
      lastActionPerformed: lastActionPerformed,
    );
  } else if (action == CounterActions.decrement) {
    count = state.count - 1;
    actions = state.totalActions + 1;
    lastActionPerformed = CounterActions.decrement;
    return CounterStateModel(
      count: count,
      totalActions: actions,
      lastActionPerformed: lastActionPerformed,
    );
  } else {
    return state;
  }
}

// Implementation of the reducer function
