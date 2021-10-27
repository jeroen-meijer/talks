import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental/backend/backend.dart';
import 'package:rental/car_overview/car_overview.dart';

/// The main app.
class App extends StatelessWidget {
  const App({
    Key? key,
    required RentalService rentalService,
  })  : _rentalService = rentalService,
        super(key: key);

  final RentalService _rentalService;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _rentalService,
      child: MaterialApp(
        title: 'Rental',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CarOverviewPage(),
      ),
    );
  }
}
