import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental/backend/backend.dart';

class CarOverviewPage extends StatelessWidget {
  const CarOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Rental Example'),
      ),
      body: Consumer<RentalService>(
        builder: (context, rentalService, _) {
          final status = rentalService.status;
          final cars = rentalService.cars;

          if (status == RentalServiceStatus.loading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (cars.isEmpty) {
            return const Center(
              child: Text('No cars available'),
            );
          } else {
            return ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                final car = cars[index];

                return CarListTile(
                  car: cars[index],
                  onTap: !car.isAvailableForRental
                      ? null
                      : () {
                          throw UnimplementedError();
                        },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class CarListTile extends StatelessWidget {
  const CarListTile({
    Key? key,
    required this.car,
    this.onTap,
  }) : super(key: key);

  final Car car;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final formattedPrice = car.pricePerDay.toStringAsFixed(2);

    // TODO: Implement better UI.
    return ListTile(
      onTap: onTap,
      title: Text(car.model),
      subtitle: Text(car.make),
      trailing: Text('£ $formattedPrice'),
    );
  }
}
