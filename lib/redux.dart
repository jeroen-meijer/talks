import 'package:meta/meta.dart';

class AppState {
  AppState({@required this.counter});

  final int counter;

  AppState copyWith({int counter}) =>
      AppState(counter: counter ?? this.counter);

  static AppState get initialState => AppState(counter: 0);
}

AppState reducer(AppState state, dynamic action) {
  assert(action is ReduxAction);

  if (action is IncrementCounter) {
    return state.copyWith(counter: state.counter + action.amount);
  } else if (action is Init) {
    return AppState.initialState;
  } else {
    return state;
  }
}

abstract class ReduxAction {}

class IncrementCounter extends ReduxAction {
  IncrementCounter({this.amount = 1});

  final int amount;
}

class Init extends ReduxAction {}
