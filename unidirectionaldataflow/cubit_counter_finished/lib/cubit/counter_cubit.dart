import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

/// The example cubit that hold a [CounterState] and has the ability to
/// produce a new state with an incremented counter using the [increment]
/// method.
class CounterCubit extends Cubit<CounterState> {
  /// The cubit is always initialized with a [CounterState] where the counter is
  /// set to `0`.
  CounterCubit() : super(const CounterState(0));

  /// Takes the current counter value from the [state], increments it and
  /// emits/produces a new state with that incremented counter.
  void increment() {
    final currentCounter = state.counter;
    final newCounter = currentCounter + 1;

    final newState = CounterState(newCounter);
    emit(newState);

    // A shorter version of the same code:
    //   emit(CounterState(state.counter + 1));

    // Notice we could emit multiple states, which means we can easily handle
    // asynchronous calls.
    //
    // For example, you can first emit a loading state, then fetch some data
    // from a server asynchronously and finally emit a new state with that data.
  }
}
