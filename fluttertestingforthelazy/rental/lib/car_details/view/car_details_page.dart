import 'package:flutter/material.dart';
import 'package:rental/backend/backend.dart';

class CarDetailsPage extends StatelessWidget {
  const CarDetailsPage({
    Key? key,
    required this.car,
  }) : super(key: key);

  final Car car;

  static Route<void> route({required Car car}) {
    return MaterialPageRoute<void>(
      builder: (context) => CarDetailsPage(car: car),
    );
  }

  Color _getCarColor(CarColor color) {
    switch (color) {
      case CarColor.red:
        return Colors.red;
      case CarColor.blue:
        return Colors.blue;
      case CarColor.yellow:
        return Colors.yellow;
      case CarColor.black:
        return Colors.black;
      case CarColor.white:
        return Colors.white;
    }
  }

  String _getCarColorName(CarColor color) {
    switch (color) {
      case CarColor.red:
        return 'Red';
      case CarColor.blue:
        return 'Blue';
      case CarColor.yellow:
        return 'Yellow';
      case CarColor.black:
        return 'Black';
      case CarColor.white:
        return 'White';
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedPrice = car.pricePerDay.toStringAsFixed(2);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('${car.make} ${car.model}'),
            collapsedHeight: kToolbarHeight,
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ColoredBox(
                color: Colors.white,
                child: Image.network(
                  car.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ListTile(
                  title: Text(car.make),
                  subtitle: const Text('Make'),
                ),
                ListTile(
                  title: Text(car.model),
                  subtitle: const Text('Model'),
                ),
                ListTile(
                  title: Text(car.year.toString()),
                  subtitle: const Text('Year'),
                ),
                ListTile(
                  title: Text('£$formattedPrice'),
                  subtitle: const Text('Price per day'),
                ),
                ListTile(
                  title: Text(_getCarColorName(car.color)),
                  subtitle: const Text('Color'),
                  trailing: Material(
                    color: _getCarColor(car.color),
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const SizedBox(
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
