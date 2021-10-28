import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:rental/app/app.dart';
import 'package:rental/backend/backend.dart';

Future<void> main() async {
  final rentalService = RentalService();
  unawaited(rentalService.getCars());

  WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setEnabledSystemUIMode();

  runApp(
    App(
      rentalService: rentalService,
    ),
  );
}
