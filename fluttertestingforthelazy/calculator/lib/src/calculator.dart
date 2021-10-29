import 'package:rxdart/subjects.dart';

/// {@template calculator}
/// A calculator that can be used to perform basic math operations.
/// {@endtemplate}
class Calculator {
  /// {@macro calculator}
  Calculator();

  final _history = BehaviorSubject<List<double>>.seeded([0]);

  /// A [Stream] of the history (`List<double>`) of this calculator.
  Stream<List<double>> get history => _history.stream;

  /// A [Stream] of the current value.
  Stream<double> get value => _history.map((history) => history.last);

  /// The current value of this calculator.
  double get currentValue => _history.value.last;

  void _appendToHistory(double value) {
    _history.add([..._history.value, value]);
  }

  /// Resets the calculator and clears the history.
  void reset() {
    _history.add([0]);
  }

  /// Adds the given [value] to the current value.
  void add(double value) {
    _appendToHistory(_history.value.last + value);
  }

  /// Subtracts the given [value] from the current value.
  void subtract(double value) {
    _appendToHistory(_history.value.last - value);
  }

  /// Multiplies the current value by the given [value].
  void multiply(double value) {
    _appendToHistory(_history.value.last * value);
  }

  /// Divides the current value by the given [value].
  ///
  /// If [value] is zero, throws an [ArgumentError].
  void divide(double value) {
    if (value == 0) {
      throw ArgumentError.value(value, 'value', 'Cannot divide by zero');
    }

    _appendToHistory(_history.value.last / value);
  }
}
