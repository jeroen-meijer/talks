import 'package:flutter/material.dart';
import 'package:rental/app/app.dart';
import 'package:rental/backend/backend.dart';

void main() {
  final rentalService = RentalService();

  runApp(
    App(
      rentalService: rentalService,
    ),
  );
}
