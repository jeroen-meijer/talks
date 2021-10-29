import 'package:equatable/equatable.dart';

/// The color of a [Car].
enum CarColor {
  /// A black car.
  black,

  /// A white car.
  white,

  /// A red car.
  red,

  /// A blue car.
  blue,

  /// A yellow car.
  yellow,
}

/// {@template car}
/// An example car model.
/// {@endtemplate}
class Car extends Equatable {
  /// {@macro car}
  const Car({
    required this.make,
    required this.model,
    required this.year,
    required this.color,
    this.isAvailableForRental = true,
    required this.pricePerDay,
    required this.imageUrl,
  });

  /// The brand of the car.
  final String make;

  /// The specific model of the car.
  final String model;

  /// The year the car was made.
  final int year;

  /// The color of the car.
  final CarColor color;

  /// Whether the car is available for rental.
  final bool isAvailableForRental;

  /// The rental price of the car per day.
  final double pricePerDay;

  /// The preview image url of the car.
  final String imageUrl;

  @override
  List<Object> get props => [
        make,
        model,
        year,
        color,
        isAvailableForRental,
        pricePerDay,
        imageUrl,
      ];
}
