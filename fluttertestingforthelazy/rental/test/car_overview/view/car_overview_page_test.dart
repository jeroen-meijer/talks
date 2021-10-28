import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:provider/provider.dart';
import 'package:rental/backend/backend.dart';
import 'package:rental/car_overview/car_overview.dart';

class MockRentalService extends Mock implements RentalService {}

void main() {
  const car = Car(
    make: 'mock-car-make',
    model: 'mock-car-model',
    year: 1234,
    color: CarColor.white,
    pricePerDay: 123,
    imageUrl: 'mock-image-url',
  );

  group('CarOverviewPage', () {
    late RentalService rentalService;
    late MockNavigator navigator;

    setUp(() {
      rentalService = MockRentalService();
      when(() => rentalService.getCars()).thenAnswer((_) async {});
      when(() => rentalService.status).thenReturn(RentalServiceStatus.success);
      when(() => rentalService.cars).thenReturn([car]);

      navigator = MockNavigator();
      when(() => navigator.push(any())).thenAnswer((_) async {});
    });

    Widget buildSubject() {
      return ChangeNotifierProvider.value(
        value: rentalService,
        child: const MaterialApp(
          home: CarOverviewPage(),
        ),
      );
    }

    testWidgets(
      'renders a spinner '
      'when the status is loading',
      (tester) async {
        when(() => rentalService.status)
            .thenReturn(RentalServiceStatus.loading);
        await tester.pumpWidget(buildSubject());

        expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
      },
    );

    testWidgets(
      'renders empty text '
      'when no cars are available',
      (tester) async {
        when(() => rentalService.cars).thenReturn([]);
        await tester.pumpWidget(buildSubject());

        expect(find.text('No cars available'), findsOneWidget);
      },
    );

    testWidgets(
      'renders CarListTiles '
      'when cars are available',
      (tester) async {
        await mockNetworkImages(() async {
          await tester.pumpWidget(buildSubject());

          expect(find.byType(CarListTile), findsOneWidget);
        });
      },
    );

    testWidgets(
      'navigates to CarDetailsPage '
      'when a car is tapped',
      (tester) async {
        await mockNetworkImages(() async {
          await tester.pumpWidget(buildSubject());

          await tester.tap(find.byType(CarListTile));

          verify(() => navigator.push(any()));
        });
      },
    );
  });

  group('CarListTile', () {
    Widget buildSubject({
      VoidCallback? onTap,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: CarListTile(
            car: car,
            onTap: onTap,
          ),
        ),
      );
    }

    testWidgets('renders title with year', (tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(buildSubject());

        expect(find.text('mock-car-model (1234)'), findsOneWidget);
      });
    });

    testWidgets('renders make', (tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(buildSubject());

        expect(find.text('mock-car-make'), findsOneWidget);
      });
    });

    testWidgets('renders formatted price', (tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(buildSubject());

        expect(find.text('£123.00'), findsOneWidget);
      });
    });

    testWidgets('calls onTap when pressed', (tester) async {
      await mockNetworkImages(() async {
        var callCount = 0;
        await tester.pumpWidget(
          buildSubject(
            onTap: () => callCount++,
          ),
        );

        await tester.tap(find.byType(CarListTile));

        expect(callCount, 1);
      });
    });
  });
}
