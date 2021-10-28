import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental/backend/backend.dart';
import 'package:rental/car_details/car_details.dart';

class CarOverviewPage extends StatelessWidget {
  const CarOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              padding: EdgeInsets.zero,
              itemCount: cars.length,
              itemBuilder: (context, index) {
                final car = cars[index];

                return CarListTile(
                  car: cars[index],
                  onTap: !car.isAvailableForRental
                      ? null
                      : () {
                          Navigator.of(context).push(
                            CarDetailsPage.route(
                              car: car,
                            ),
                          );
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

    return Opacity(
      opacity: onTap == null ? 0.5 : 1,
      child: ListTile(
        onTap: onTap,
        leading: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(8),
          clipBehavior: Clip.antiAlias,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              car.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text('${car.model} (${car.year})'),
        subtitle: Text(car.make),
        trailing: Column(
          children: [
            Text(
              '£$formattedPrice',
              style: Theme.of(context).textTheme.headline6,
            ),
            const Text('per day'),
          ],
        ),
      ),
    );
  }
}
