part of 'counter_cubit.dart';

/// The state of the [CounterCubit] that holds a single [counter] `int`.
///
/// Notice that this class is immutable, so it cannot be changed.
/// A new [CounterState] has to be constructed any time we want to update the
/// state of the [CounterCubit].
///
/// The [props] property comes from the [Equatable] package. It allows us to
/// easily tell if two [CounterState]s are the same by comparing their [props].
class CounterState extends Equatable {
  const CounterState(this.counter);

  final int counter;

  @override
  List<Object> get props => [counter];
}
