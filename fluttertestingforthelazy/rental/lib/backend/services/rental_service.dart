import 'package:flutter/material.dart';
import 'package:rental/backend/backend.dart';

enum RentalServiceStatus { initial, loading, success, failure }

/// {@template rental_service}
/// An example backend service that provides access to cars available for
/// rental.
/// {@endtemplate}
class RentalService extends ChangeNotifier {
  /// {@macro rental_service}
  RentalService();

  var _status = RentalServiceStatus.initial;
  RentalServiceStatus get status => _status;

  var _cars = <Car>[];
  List<Car> get cars => _cars;

  /// Retrieves all cars.
  Future<void> getCars() async {
    _status = RentalServiceStatus.loading;
    notifyListeners();

    await Future<void>.delayed(const Duration(seconds: 1));
    _status = RentalServiceStatus.success;
    _cars = _exampleCars;
    notifyListeners();
  }
}

const _exampleCars = [
  Car(
    make: 'Honda',
    model: 'Civic',
    year: 2019,
    color: CarColor.white,
    pricePerDay: 100,
    imageUrl:
        'https://di-uploads-pod2.dealerinspire.com/hondanorth/uploads/2019/04/2019-Honda-Civic-LX-Platinum-White-Pearl-HERO.png',
  ),
  Car(
    make: 'Tesla',
    model: 'Model S',
    year: 2019,
    color: CarColor.black,
    pricePerDay: 120,
    imageUrl: 'https://i.ytimg.com/vi/Eb41ppq-ATU/maxresdefault.jpg',
  ),
  Car(
    make: 'Tesla',
    model: 'Model X',
    year: 2019,
    color: CarColor.red,
    pricePerDay: 150,
    imageUrl: 'https://i.ytimg.com/vi/ZO01WW1VxOY/maxresdefault.jpg',
  ),
  Car(
    make: 'Ford',
    model: 'Focus',
    year: 2018,
    color: CarColor.blue,
    pricePerDay: 80,
    imageUrl:
        'https://images.pistonheads.com/nimg/44600/Focus_ST_Edition_005.jpg',
  ),
  Car(
    make: 'Volkswagen',
    model: 'Polo',
    year: 2018,
    color: CarColor.yellow,
    isAvailableForRental: false,
    pricePerDay: 60,
    imageUrl:
        'https://images.91wheels.com/news/wp-content/uploads/2020/05/Modified-Volkswagen-Polo-2.jpg',
  ),
];
