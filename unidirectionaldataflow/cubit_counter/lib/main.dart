// import 'package:cubit_counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(CubitCounterExample());
}

class CubitCounterExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit Counter Example',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Using the BlocProvider, we make sure any descendents in the widget tree
      // have access to the CounterCubit created in the "create" function.
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Counter Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // Using the BlocBuilder, we retrieve the state of the nearest
            // CounterCubit and display the counter inside.
            //
            // Any time our CounterCubit's state is changed, this part of the
            // tree rebuilds, and nothing else.
            Text(
              '...',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ...
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
