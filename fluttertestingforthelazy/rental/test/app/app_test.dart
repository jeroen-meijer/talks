import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rental/app/app.dart';
import 'package:rental/backend/backend.dart';
import 'package:rental/car_overview/car_overview.dart';

class MockRentalService extends Mock implements RentalService {}

void main() {
  group('App', () {
    late RentalService rentalService;

    setUp(() {
      rentalService = MockRentalService();
      when(() => rentalService.getCars()).thenAnswer((_) async {});
      when(() => rentalService.status).thenReturn(RentalServiceStatus.success);
      when(() => rentalService.cars).thenReturn([]);
    });

    Widget buildSubject() {
      return App(
        rentalService: rentalService,
      );
    }

    testWidgets('renders MaterialApp', (tester) async {
      await tester.pumpWidget(buildSubject());

      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('renders CarOverviewPage', (tester) async {
      await tester.pumpWidget(buildSubject());

      expect(find.byType(CarOverviewPage), findsOneWidget);
    });
  });
}
