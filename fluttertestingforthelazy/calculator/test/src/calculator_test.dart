// ignore_for_file: prefer_const_constructors
import 'package:calculator/calculator.dart';
import 'package:test/test.dart';

void main() {
  group('Calculator', () {
    test('can be instantiated', () {
      expect(() => Calculator(), returnsNormally);
    });

    test('history returns stream of updated history values', () {
      final instance = Calculator();

      expect(
        instance.history,
        emitsInOrder(<List<double>>[
          [0],
          [0, 1],
          [0, 1, 2],
          [0, 1, 2, 3],
        ]),
      );

      instance
        ..add(1)
        ..add(1)
        ..add(1);
    });

    test('value returns stream of current value', () {
      final instance = Calculator();

      expect(
        instance.value,
        emitsInOrder(<double>[0, 1, 2, 3]),
      );

      instance
        ..add(1)
        ..add(1)
        ..add(1);
    });

    test('currentValue returns current value', () {
      final instance = Calculator();
      expect(instance.currentValue, equals(0));

      instance.add(10);
      expect(instance.currentValue, equals(10));
    });

    group('add method', () {
      test('adds given value to current value', () {
        final instance = Calculator()..add(2);

        expect(instance.currentValue, equals(2));
      });
    });

    group('divide method', () {
      test('throws ArgumentError when divisor is 0', () {
        final instance = Calculator();

        expect(() => instance.divide(0), throwsArgumentError);
      });
    });
  });
}
